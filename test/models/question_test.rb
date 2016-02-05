# == Schema Information
#
# Table name: questions
#
#  question    :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  id          :uuid             not null, primary key
#  exam_id     :uuid
#  subtopic_id :uuid
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
