# == Schema Information
#
# Table name: campus
#
#  id             :integer          not null, primary key
#  campus_name    :string
#  location       :string
#  institution_id :uuid
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Campu < ActiveRecord::Base
	belongs_to :institution
end
