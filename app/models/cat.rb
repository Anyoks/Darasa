class Cat < ActiveRecord::Base
	mount_uploader :attachment, PdfUploader #mount the pdf uploader

	validates_presence_of :cat_name, :date, :attachment, :unit 

	belongs_to :unit
end
