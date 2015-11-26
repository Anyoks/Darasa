# == Schema Information
#
# Table name: exams
#
#  title      :string
#  attachment :string
#  date       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  question   :text
#  id         :uuid             not null, primary key
#  unit_id    :uuid
#

class Exam < ActiveRecord::Base
	require 'json'

	# mount_uploader :attachment, PdfUploader #mount the pdf uploader

	validates_presence_of :title, :date, :unit 

	belongs_to :unit

	has_many :questions, :dependent => :destroy

	has_many :answers, :through => :questions

	accepts_nested_attributes_for :questions,  :allow_destroy => true



end
