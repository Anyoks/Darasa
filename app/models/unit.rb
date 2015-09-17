class Unit < ActiveRecord::Base
	has_many :topics
	belongs_to :semester
end
