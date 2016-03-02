# == Schema Information
#
# Table name: topic_activities
#
#  id         :uuid             not null, primary key
#  user_id    :uuid
#  topic_id   :uuid
#  time       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  note       :string
#

class TopicActivity < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :user
	belongs_to :topic
end
