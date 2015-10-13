class Exam < ActiveRecord::Base

	mount_uploader :attachment, PdfUploader #mount the pdf uploader

	validates_presence_of :exam_name, :date, :attachment, :unit 

	belongs_to :unit
end
