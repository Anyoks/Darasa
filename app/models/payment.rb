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
