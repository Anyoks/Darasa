# == Schema Information
#
# Table name: years
#
#  year       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  id         :uuid             not null, primary key
#  course_id  :uuid
#

class Year < ActiveRecord::Base
	has_many :semesters
	belongs_to :course

	def semester semester_id
		semester = Semester.all
		semester.find { |sem| sem.year_id == semester_id }
	end
end
