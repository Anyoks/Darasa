# == Schema Information
#
# Table name: exams
#
#  id         :integer          not null, primary key
#  title      :string
#  attachment :string
#  date       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  unit_id    :integer          default(4)
#  question   :text
#  uuid       :uuid
#

require 'test_helper'

class ExamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
