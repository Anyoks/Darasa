# == Schema Information
#
# Table name: subtopics
#
#  id                :uuid             not null, primary key
#  title             :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  topic_id          :uuid
#  deleted_at        :datetime
#  html_file_name    :string
#  html_content_type :string
#  html_file_size    :integer
#  html_updated_at   :datetime
#

require 'test_helper'

class SubtopicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
