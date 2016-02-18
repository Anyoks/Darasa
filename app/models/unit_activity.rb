# == Schema Information
#
# Table name: unit_activities
#
#  id         :uuid             not null, primary key
#  user_id    :uuid
#  unit_id    :uuid
#  time       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  note       :string
#

class UnitActivity < ActiveRecord::Base
	belongs_to :unit 
	belongs_to :user
end
