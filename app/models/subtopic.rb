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

	validates_presence_of :title, :topic

	has_many :questions, :dependent => :destroy

	has_many :answers, :through => :questions

	accepts_nested_attributes_for :questions,  :allow_destroy => true
end
