class Course < ActiveRecord::Base
	has_many :years
	belongs_to :university
end
