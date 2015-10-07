class Course < ActiveRecord::Base
	has_many :years
	belongs_to :university

	def year course_id
		year = Year.all
		year.find { |y| y.course_id == course_id }
	end
end
