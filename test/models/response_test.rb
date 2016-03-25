# == Schema Information
#
# Table name: responses
#
#  answer      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  id          :uuid             not null, primary key
#  question_id :uuid
#  video       :string
#  deleted_at  :datetime
#

require 'test_helper'

class ResponseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
