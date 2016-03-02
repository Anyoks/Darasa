# == Schema Information
#
# Table name: prices
#
#  amount  :float
#  id      :uuid             not null, primary key
#  content :string
#

class Price < ActiveRecord::Base
	# has_many :units, :dependent => :destroy
	acts_as_paranoid
end
