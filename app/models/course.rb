# == Schema Information
#
# Table name: courses
#
#  id            :integer          not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  university_id :integer          default(1)
#

class Course < ActiveRecord::Base
	has_many :years
	belongs_to :university

	def year course_id
		year = Year.all
		year.find { |y| y.course_id == course_id }
	end
end
