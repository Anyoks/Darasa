# == Schema Information
#
# Table name: questions
#
#  question          :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  id                :uuid             not null, primary key
#  exam_id           :uuid
#  subtopic_id       :uuid
#  deleted_at        :datetime
#  html_file_name    :string
#  html_content_type :string
#  html_file_size    :integer
#  html_updated_at   :datetime
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
