# == Schema Information
#
# Table name: failed_payments
#
#  id         :uuid             not null, primary key
#  user_id    :uuid
#  topic_id   :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  mpesa_code :string
#  amount     :string
#  deleted_at :datetime
#

require 'test_helper'

class FailedPaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
