# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  name       :string
#  code       :string
#  attachment :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  unit_id    :integer          default(1)
#

require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
