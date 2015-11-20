# == Schema Information
#
# Table name: universities
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  uuid       :uuid
#

class University < ActiveRecord::Base
	has_many :courses
end
