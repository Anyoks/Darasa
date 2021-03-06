# == Schema Information
#
# Table name: failed_payments
#
#  id         :uuid             not null, primary key
#  user_id    :uuid
#  topic_id   :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  mpesa_code :string
#  amount     :string
#  deleted_at :datetime
#

class FailedPayment < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :user
	
	#Finding The topic this failed payment is for.
	def topic
		topic = Topic.find(self.topic_id)
		return topic
	end
end
