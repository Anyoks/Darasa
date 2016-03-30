# == Schema Information
#
# Table name: systems
#
#  id          :uuid             not null, primary key
#  system_name :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class System < ActiveRecord::Base
	acts_as_paranoid
	has_many :types
end
