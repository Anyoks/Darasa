# == Schema Information
#
# Table name: question_activities
#
#  id          :uuid             not null, primary key
#  user_id     :uuid
#  question_id :uuid
#  time        :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  note        :string
#

class QuestionActivity < ActiveRecord::Base
	belongs_to :user
	belongs_to :question 
end
