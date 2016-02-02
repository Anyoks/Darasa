# == Schema Information
#
# Table name: subtopics
#
#  id         :uuid             not null, primary key
#  title      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  topic_id   :uuid
#

class Subtopic < ActiveRecord::Base
	belongs_to :topic
end
