# == Schema Information
#
# Table name: responses
#
#  id          :integer          not null, primary key
#  answer      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer          default(27)
#

class Response < ActiveRecord::Base
	belongs_to :question
end
