# == Schema Information
#
# Table name: subtopics
#
#  id         :uuid             not null, primary key
#  title      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  topic_id   :uuid
#

class Subtopic < ActiveRecord::Base
	acts_as_paranoid
	# self.per_page = 10

	has_attached_file :html , styles: { medium: "300x300>", thumb: "100x100>" },  :url => "/system/:class/:attachment/:id_partition/:style/:filename",
	 :path  => ":rails_root/public:url"
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  do_not_validate_attachment_file_type :html
	
	belongs_to :topic

	validates_presence_of :title, :topic

	has_many :questions, :dependent => :destroy

	has_many :answers, :through => :questions

	has_many :uploads

	accepts_nested_attributes_for :questions, reject_if: proc { |attributes| attributes['question'].blank? }, :allow_destroy => true

	
end
