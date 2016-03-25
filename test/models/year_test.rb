# == Schema Information
#
# Table name: years
#
#  year       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  id         :uuid             not null, primary key
#  course_id  :uuid
#  deleted_at :datetime
#

require 'test_helper'

class YearTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
