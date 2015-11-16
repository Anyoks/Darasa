# == Schema Information
#
# Table name: years
#
#  id         :integer          not null, primary key
#  year       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :integer          default(1)
#

require 'test_helper'

class YearTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
