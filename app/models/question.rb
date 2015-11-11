class Question < ActiveRecord::Base
	belongs_to :exam

	has_one :response, :dependent => :destroy

	accepts_nested_attributes_for :response#, :reject_if => lambda { |a| a[:response].blank? }, :allow_destroy => true
end
