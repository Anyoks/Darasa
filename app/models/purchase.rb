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
#

class Purchase < ActiveRecord::Base
	belongs_to :user
	belongs_to :topic
	belongs_to :payment
end
