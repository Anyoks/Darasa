# == Schema Information
#
# Table name: payments
#
#  id          :integer          not null, primary key
#  status      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  unit_id     :integer
#  semester_id :integer
#  exam_id     :integer
#

class Payment < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :user_id, :unit_id, :semester_id

end
