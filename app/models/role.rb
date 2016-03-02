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
	acts_as_paranoid
	 has_many :users, :dependent => :destroy
end
