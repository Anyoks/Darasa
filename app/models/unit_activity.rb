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
	acts_as_paranoid
	belongs_to :unit 
	belongs_to :user

	def self.user
		user_name = []
		time_accessed = []

		together = []

		UnitActivity.all.each do |activity|
			user_name << activity.user.first_name
			time_accessed << activity.time
			together << activity.user.first_name
			together << activity.time

		end
		return together
		# hash = Hash[*user_name.zip(time_accessed).flatten]
		# hash = Hash[*user_name.zip(time_accessed)]

	end

end
