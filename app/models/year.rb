# == Schema Information
#
# Table name: years
#
#  id         :integer          not null, primary key
#  year       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :integer          default(1)
#  uuid       :uuid
#

class Year < ActiveRecord::Base
	has_many :semesters
	belongs_to :course

	def semester semester_id
		semester = Semester.all
		semester.find { |sem| sem.year_id == semester_id }
	end
end
