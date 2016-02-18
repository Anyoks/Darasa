# == Schema Information
#
# Table name: over_pays
#
#  id         :integer          not null, primary key
#  topic_id   :string
#  mpesa_code :string
#  user_id    :string
#  amount     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class OverPayTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
