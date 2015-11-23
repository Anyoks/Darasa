# == Schema Information
#
# Table name: universities
#
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  id         :uuid             not null, primary key
#

class University < ActiveRecord::Base
	has_many :courses
end
