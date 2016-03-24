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
	do_not_validate_attachment_file_type :document

	private

end
