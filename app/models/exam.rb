# == Schema Information
#
# Table name: exams
#
#  id         :integer          not null, primary key
#  title      :string
#  attachment :string
#  date       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  unit_id    :integer          default(4)
#  question   :text
#  uuid       :uuid
#

class Exam < ActiveRecord::Base
	require 'json'

	mount_uploader :attachment, PdfUploader #mount the pdf uploader

	validates_presence_of :title, :date, :unit 

	belongs_to :unit

	has_many :questions, :dependent => :destroy

	has_many :answers, :through => :questions

	accepts_nested_attributes_for :questions, :reject_if => :all_blank, :allow_destroy => true

	 # def as_json(options={})
  #     super(:only => [:questions]
  #     )
    # end




end
