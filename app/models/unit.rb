# == Schema Information
#
# Table name: units
#
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  answers_price :float
#  videos_price  :float
#  id            :uuid             not null, primary key
#  semester_id   :uuid
#  price_id      :uuid
#  available     :boolean          default(FALSE)
#

class Unit < ActiveRecord::Base
	has_many :topics,:dependent => :destroy
	belongs_to :semester
	# has_many :cats
	has_many :exams
	belongs_to :price

	def all_units
		Unit.all.each do |unit|
			p "#{unit.name} || #{unit.id} "
		end
	end


	def make_unit_unavilble unit_id
		# unit_id = unit_id
		unit = Unit.find(unit_id)
		unit.update_attribute(:available, false)
	end

	def make_unit_avilble unit_id
		# unit_id = unit_id
		unit = Unit.find(unit_id)
		unit.update_attribute(:available, true)
	end

end
