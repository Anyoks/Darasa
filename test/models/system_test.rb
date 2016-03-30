# == Schema Information
#
# Table name: systems
#
#  id          :uuid             not null, primary key
#  system_name :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class SystemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
