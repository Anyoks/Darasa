# == Schema Information
#
# Table name: units
#
#  id            :integer          not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  semester_id   :integer          default(1)
#  answers_price :float
#  videos_price  :float
#  uuid          :uuid
#

require 'test_helper'

class UnitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
