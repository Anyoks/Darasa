# == Schema Information
#
# Table name: users
#
#  email                  :string           not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  first_name             :string
#  phone_number           :string
#  university             :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  second_name            :string
#  terms                  :boolean          default(FALSE)
#  provider               :string
#  uid                    :string
#  role_id                :integer
#  terms_updated_at       :datetime
#  authentication_token   :text
#  id                     :uuid             not null, primary key
#  unique_session_id      :string(20)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
