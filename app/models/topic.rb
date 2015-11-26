# == Schema Information
#
# Table name: topics
#
#  name       :string
#  code       :string
#  attachment :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  unit_id    :integer          default(1)
#  id         :uuid             not null, primary key
#

class Topic < ActiveRecord::Base

	# mount_uploader :attachment, PdfUploader #mount the pdf uploader

	validates_presence_of :name, :code, :attachment, :unit # make sure these two are entered

	belongs_to :unit
end
