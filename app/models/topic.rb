class Topic < ActiveRecord::Base

	mount_uploader :attachment, PdfUploader #mount the pdf uploader

	validates_presence_of :name, :code, :attachment # make sure these two are entered
end
