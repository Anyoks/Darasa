# == Schema Information
#
# Table name: uploads
#
#  id                    :uuid             not null, primary key
#  subtopic_id           :uuid
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  document_file_name    :string
#  document_content_type :string
#  document_file_size    :integer
#  document_updated_at   :datetime
#  response_file_name    :string
#  response_content_type :string
#  response_file_size    :integer
#  response_updated_at   :datetime
#

class Upload < ActiveRecord::Base
	belongs_to :subtopic
	
	# def self.subtopic_name subtopic_id
	# 	id = subtopic_id
	# 	Subtopic.where(:id => id)
	# 	# return self.subtopic.title
	# end

	# subtopic = Upload.subtopic_name

	has_attached_file :document , :url => "/system/:class/:attachment/:id_partition/:filename",
	:path  => ":rails_root/public:url"
	# validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	do_not_validate_attachment_file_type :document #the uestion

	has_attached_file :response , :url => "/system/:class/:attachment/:id_partition/:filename",
	:path  => ":rails_root/public:url"
	# validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	do_not_validate_attachment_file_type :response

	has_attached_file :pictures , :url => "/system/:class/:attachment/:id_partition/:filename",
	:path  => ":rails_root/public:url"

	do_not_validate_attachment_file_type :pictures

	# def get_questions url
	# 	doc = Nokogiri::HTML(open("url"))
	# end

end
