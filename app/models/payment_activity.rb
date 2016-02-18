# == Schema Information
#
# Table name: payment_activities
#
#  id         :integer          not null, primary key
#  user_id    :uuid
#  topic_id   :uuid
#  note       :string
#  mpesa_code :string
#  time       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PaymentActivity < ActiveRecord::Base
	belongs_to :user
	belongs_to :topic
end
