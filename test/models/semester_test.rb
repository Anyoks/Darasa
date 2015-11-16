# == Schema Information
#
# Table name: semesters
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  year_id    :integer          default(1)
#

require 'test_helper'

class SemesterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
