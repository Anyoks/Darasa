# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  question   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  exam_id    :integer          default(5)
#

class Question < ActiveRecord::Base
	require 'json'
	belongs_to :exam

	has_one :response, :dependent => :destroy

	accepts_nested_attributes_for :response#, :reject_if => lambda { |a| a[:response].blank? }, :allow_destroy => true

	def as_json(options={})
		# question = raw Question.find_by("exam_id", 25).question
      super(:only => [:id, :question]
      )
    end
end
