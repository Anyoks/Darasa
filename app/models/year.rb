class Year < ActiveRecord::Base
	has_many :semesters
	belongs_to :course
end
