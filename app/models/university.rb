# == Schema Information
#
# Table name: universities
#
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  id         :uuid             not null, primary key
#  deleted_at :datetime
#

class University < ActiveRecord::Base
	acts_as_paranoid
	# self.per_page = 10
	has_many :courses, :dependent => :destroy
end
