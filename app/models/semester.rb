class Semester < ActiveRecord::Base
	has_many :units
	belongs_to :year
end
