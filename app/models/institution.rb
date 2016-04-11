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
	has_many :profiles
	has_many :units

	belongs_to :institution_type

	def self.with_type(type_name)
		type  = InstitutionType.where( :type_name => type_name).first
		where(:institution_type_id => type.id)
		
	end
end
