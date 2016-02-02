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
	has_many :topics
	belongs_to :semester
	has_many :cats
	has_many :exams
	belongs_to :price
end
