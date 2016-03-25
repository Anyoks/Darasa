# == Schema Information
#
# Table name: topic_activities
#
#  id         :uuid             not null, primary key
#  user_id    :uuid
#  topic_id   :uuid
#  time       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  note       :string
#  name       :string
#  deleted_at :datetime
#

require 'test_helper'

class TopicActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
