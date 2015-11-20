# == Schema Information
#
# Table name: responses
#
#  id          :integer          not null, primary key
#  answer      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer          default(27)
#  uuid        :uuid
#

require 'test_helper'

class ResponseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
