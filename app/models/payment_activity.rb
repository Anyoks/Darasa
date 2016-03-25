# == Schema Information
#
# Table name: payment_activities
#
#  id         :uuid             not null, primary key
#  user_id    :uuid
#  topic_id   :uuid
#  note       :string
#  mpesa_code :string
#  time       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#  status     :string
#  deleted_at :datetime
#

class PaymentActivity < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :user
	belongs_to :topic
end
