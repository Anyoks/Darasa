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

require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
