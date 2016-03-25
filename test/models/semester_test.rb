# == Schema Information
#
# Table name: semesters
#
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  id         :uuid             not null, primary key
#  year_id    :uuid
#  deleted_at :datetime
#

require 'test_helper'

class SemesterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
