# == Schema Information
#
# Table name: responses
#
#  answer      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  id          :uuid             not null, primary key
#  question_id :uuid
#  video       :string
#

class Response < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :question

	# validates_presence_of :answer, :question_id
	# self.per_page = 10
	# mount_uploader :video, VideoUploader
end
