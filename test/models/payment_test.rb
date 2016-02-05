# == Schema Information
#
# Table name: payments
#
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  mpesa_code :string           not null
#  id         :uuid             not null, primary key
#  topic_id   :uuid
#  user_id    :uuid
#  status     :string
#

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
