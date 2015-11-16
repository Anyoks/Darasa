# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  response    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer
#

class Answer < ActiveRecord::Base
	belongs_to :question
end
