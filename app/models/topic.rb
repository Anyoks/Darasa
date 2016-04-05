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
#  deleted_at :datetime
#

class Topic < ActiveRecord::Base

	# mount_uploader :attachment, PdfUploader #mount the pdf uploader

	acts_as_paranoid

	# self.per_page = 10

	validates_presence_of :name, :unit # make sure these two are entered

	belongs_to :unit

	has_many :subtopics,  :dependent => :destroy

	has_many :purchases, :dependent => :destroy

	has_many :questions, :through => :subtopics
	
	#LOGGING USER ACTIVITES
	has_many :topic_activities, :dependent => :destroy
	has_many :payment_activities, :dependent => :destroy

	def make_sample
		self.update_attributes :sample => true
	end

	def undo_sample
		self.update_attributes :sample => false
	end

	def is_sample?
		self.sample?
	end
	
end
