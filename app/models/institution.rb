# == Schema Information
#
# Table name: institutions
#
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  id         :uuid             not null, primary key
#  deleted_at :datetime
#  country    :string
#  type_id    :uuid
#

class Institution < ActiveRecord::Base
	acts_as_paranoid
	# self.per_page = 10
	has_many :courses, :dependent => :destroy
	has_many :campus, :dependent => :destroy
end
