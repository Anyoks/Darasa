# == Schema Information
#
# Table name: exams
#
#  title      :string
#  attachment :string
#  date       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  question   :text
#  id         :uuid             not null, primary key
#  unit_id    :uuid
#

require 'test_helper'

class ExamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
