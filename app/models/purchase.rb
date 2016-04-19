# == Schema Information
#
# Table name: purchases
#
#  id         :uuid             not null, primary key
#  user_id    :uuid
#  topic_id   :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  payment_id :uuid
#  deleted_at :datetime
#

class Purchase < ActiveRecord::Base
	acts_as_paranoid
	
	belongs_to :user
	belongs_to :topic
	belongs_to :payment


	#Make an admin own all topics 
	def self.own_all user
		topic_ids = Topic.select('id count(*)').group('id').pluck('id')
		user_id = user

		mpesa_code = "ADMIN_OWNERSHIP"
		num = 0
		
		topic_ids.each do |topic|
			# num +=1
			mpesa_code = mpesa_code + rand.to_s
			p = Payment.new(:topic_id => "#{topic}", :mpesa_code => "#{mpesa_code}", :user_id => "#{user_id}" )
			p.save
			# num +=1
			# mpesa_code = mpesa_code + rand.to_s
		end
	end
end
