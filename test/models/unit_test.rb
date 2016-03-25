# == Schema Information
#
# Table name: units
#
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  answers_price :float
#  videos_price  :float
#  id            :uuid             not null, primary key
#  semester_id   :uuid
#  price_id      :uuid
#  available     :boolean          default(FALSE)
#  deleted_at    :datetime
#

require 'test_helper'

class UnitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
