# == Schema Information
#
# Table name: payments
#
#  id                                                              :integer          not null, primary key
#  status                                                          :boolean
#  created_at                                                      :datetime         not null
#  updated_at                                                      :datetime         not null
#  unit_id                                                         :integer
#  semester_id                                                     :integer
#  exam_id                                                         :integer
#  pesapal_merchant_reference                                      :string
#  pesapal_transaction_tracking_id                                 :string
#  user_uuid                                                       :uuid
#  {:foreign_key_type=>:uuid, :index=>true, :foreign_key=>true}_id :integer
#

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
