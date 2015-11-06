class Exam < ActiveRecord::Base

	mount_uploader :attachment, PdfUploader #mount the pdf uploader

	validates_presence_of :title, :date, :unit 

	belongs_to :unit

	has_many :questions, :dependent => :destroy

	has_many :answers, :through => :questions

	accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:question].blank? }, :allow_destroy => true
end
