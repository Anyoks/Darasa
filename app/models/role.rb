# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  terms      :boolean          default(FALSE)
#

class Role < ActiveRecord::Base
	 has_many :users
end
