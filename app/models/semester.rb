# == Schema Information
#
# Table name: semesters
#
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  id         :uuid             not null, primary key
#  year_id    :uuid
#

class Semester < ActiveRecord::Base
	acts_as_paranoid
	has_many :units , :dependent => :destroy
	belongs_to :year
	# has_many :topics, through: :units
end
