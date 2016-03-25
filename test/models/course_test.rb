# == Schema Information
#
# Table name: courses
#
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  id            :uuid             not null, primary key
#  university_id :uuid
#  deleted_at    :datetime
#

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
