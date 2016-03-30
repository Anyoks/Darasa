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
#  deleted_at  :datetime
#

class Question < ActiveRecord::Base
	# require 'json'
	acts_as_paranoid

	has_attached_file :html
	
	validates_presence_of :question,:subtopic_id

	belongs_to :exam

	belongs_to :subtopic

	has_one :response, :dependent => :destroy

	accepts_nested_attributes_for :response, reject_if: proc { |attributes| attributes['answer'].blank? }, :allow_destroy => true


 	#lOGGIN USER ACTIVITIES
	has_many :question_activities, :dependent => :destroy

end
