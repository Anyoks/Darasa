# == Schema Information
#
# Table name: payments
#
#  status                          :boolean
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  pesapal_merchant_reference      :string
#  pesapal_transaction_tracking_id :string
#  id                              :uuid             not null, primary key
#  unit_id                         :uuid
#  user_id                         :uuid
#  semester_id                     :uuid
#

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
