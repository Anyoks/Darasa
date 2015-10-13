class Semester < ActiveRecord::Base
	has_many :units 
	belongs_to :year
	# has_many :topics, through: :units
end
