# == Schema Information
#
# Table name: payments
#
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  mpesa_code :string           not null
#  id         :uuid             not null, primary key
#  topic_id   :uuid
#  user_id    :uuid
#  status     :string
#  deleted_at :datetime
#

class Payment < ActiveRecord::Base
	acts_as_paranoid
	
	belongs_to :user

	has_one :purchase, :dependent => :destroy # only one payment record corrensponds to one purchase record. i.e each purchase is authorised by a payment.

	validates_presence_of :user_id, :topic_id, :mpesa_code

	validates :mpesa_code, uniqueness: true #ensure the mpesa  codes are unique

	after_commit :add_topic_to_user_purchases, on: [:create] # each time a user makes a confirmed purchase

	# private

	#** incase a use has issues with payment. An adminc can pay for them.

	def pay_for_me code, topic_id 
		user_id = self.user_id
		mpesa_code = code
		topic = topic_id
		
		#Check if Topic Exists
		if find_topic topic
			#Check if Mpesa code Exists
			if find_sms mpesa_code
				pay = Payment.new
				pay.topic_id =  topic
				pay.user_id = user_id
				pay.mpesa_code = mpesa_code

				begin
					#Make the payment
					pay.save!
				#Incase there Mpesa code is taken
				rescue Exception => e
					p "That Mpesa Code has been used before!"
				#everything is okay.
				else
					p "Done! Now The user has owns that topic! "
				end
			else
				"Payment has not been received. That Mpesa code is invalid"
			end
		else
			"Topic Not found. Please enter the correct Topic Id"
		end
	end

	def add_topic_to_user_purchases
		user_id = self.user_id
		topic_id = self.topic_id

		@purchase = Purchase.new(purchase_params)
		if @purchase.save
			p "You now own this topic"
		else
			p "No you don't"
		end
	end

	def find_sms mpesa_code
		sms =  Sms.find_by_mpesa_code mpesa_code

		begin
			if sms.nil?
				raise ArgumentError.new("Sms does not exist")
			end
		rescue
			false
		else
			true
		end
	end

	def find_topic topic_id
		begin
			Topic.find topic_id
		rescue => e
			false
		else
			true
		end
	end

	def find_by_topic_id topic_id
		if self.find(topic_id)
			true
		else
			false
		end
		
	end

	def purchase_params
		{ "user_id"=> "#{self.user_id}", "topic_id"=> "#{self.topic_id}", "payment_id"=> "#{self.id}"  }
	end

end
