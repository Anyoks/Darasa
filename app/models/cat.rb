# == Schema Information
#
# Table name: cats
#
#  id         :integer          not null, primary key
#  cat_name   :string
#  attachment :string
#  date       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  unit_id    :integer          default(3)
#

class Cat < ActiveRecord::Base
	# mount_uploader :attachment, PdfUploader #mount the pdf uploader

	validates_presence_of :cat_name, :date, :attachment, :unit 

	belongs_to :unit
end
