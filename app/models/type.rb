# == Schema Information
#
# Table name: types
#
#  id         :integer          not null, primary key
#  type_name  :string
#  system_id  :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Type < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :system
	
	has_many :institutions
end
