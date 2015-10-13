class Unit < ActiveRecord::Base
	has_many :topics
	belongs_to :semester
	has_many :cats
	has_many :exams
end
