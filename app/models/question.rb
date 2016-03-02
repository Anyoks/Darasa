# == Schema Information
#
# Table name: questions
#
#  question    :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  id          :uuid             not null, primary key
#  exam_id     :uuid
#  subtopic_id :uuid
#

class Question < ActiveRecord::Base
	require 'json'
	belongs_to :exam

	belongs_to :subtopic

	has_one :response, :dependent => :destroy

	accepts_nested_attributes_for :response#, :reject_if => lambda { |a| a[:response].blank? }, :allow_destroy => true

	# def as_json(options={})
	# 	# question = raw Question.find_by("exam_id", 25).question
 #      super(:only => [:id, :question]
 #      )
 #    end
 	#lOGGIN USER ACTIVITIES
	has_many :question_activities, :dependent => :destroy
end
