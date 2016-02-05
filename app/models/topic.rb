# == Schema Information
#
# Table name: topics
#
#  name       :string
#  code       :string
#  attachment :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  id         :uuid             not null, primary key
#  unit_id    :uuid
#

class Topic < ActiveRecord::Base

	# mount_uploader :attachment, PdfUploader #mount the pdf uploader

	validates_presence_of :name, :code, :unit # make sure these two are entered

	belongs_to :unit

	has_many :subtopics

	has_many :purchases, :dependent => :destroy
end
