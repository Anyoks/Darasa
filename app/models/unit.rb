# == Schema Information
#
# Table name: units
#
#  id            :integer          not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  semester_id   :integer          default(1)
#  answers_price :float
#  videos_price  :float
#  uuid          :uuid
#

class Unit < ActiveRecord::Base
	has_many :topics
	belongs_to :semester
	has_many :cats
	has_many :exams
end
