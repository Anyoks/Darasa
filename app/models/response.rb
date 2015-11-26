# == Schema Information
#
# Table name: responses
#
#  answer      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  id          :uuid             not null, primary key
#  question_id :uuid
#

class Response < ActiveRecord::Base
	belongs_to :question
	mount_uploader :video, VideoUploader
end
