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
	acts_as_paranoid
	has_many :courses, :dependent => :destroy
end
