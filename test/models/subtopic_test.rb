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

require 'test_helper'

class SubtopicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
