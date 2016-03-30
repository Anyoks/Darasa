class Profile < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :user
	belongs_to :campu
	belongs_to :institution
	belongs_to :course
end
