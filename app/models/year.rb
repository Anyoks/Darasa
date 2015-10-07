class Year < ActiveRecord::Base
	has_many :semesters
	belongs_to :course

	def semester semester_id
		semester = Semester.all
		semester.find { |sem| sem.year_id == semester_id }
	end
end
