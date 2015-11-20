# == Schema Information
#
# Table name: semesters
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  year_id    :integer          default(1)
#  uuid       :uuid
#

class Semester < ActiveRecord::Base
	has_many :units 
	belongs_to :year
	# has_many :topics, through: :units
end
