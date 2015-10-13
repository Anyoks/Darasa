class Topic < ActiveRecord::Base

	mount_uploader :attachment, PdfUploader #mount the pdf uploader

	validates_presence_of :name, :code, :attachment, :unit # make sure these two are entered

	belongs_to :unit
end
