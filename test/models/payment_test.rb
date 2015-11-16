# == Schema Information
#
# Table name: payments
#
#  id          :integer          not null, primary key
#  status      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  unit_id     :integer
#  semester_id :integer
#

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
