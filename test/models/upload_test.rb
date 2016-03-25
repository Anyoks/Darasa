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

require 'test_helper'

class UploadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
