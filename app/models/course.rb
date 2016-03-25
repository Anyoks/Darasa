# == Schema Information
#
# Table name: courses
#
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  id            :uuid             not null, primary key
#  university_id :uuid
#  deleted_at    :datetime
#

class Course < ActiveRecord::Base
	acts_as_paranoid
	has_many :years, :dependent => :destroy
	belongs_to :university

	# self.per_page = 10

	def year course_id
		year = Year.all
		year.find { |y| y.course_id == course_id }
	end
end
