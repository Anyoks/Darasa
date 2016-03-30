# == Schema Information
#
# Table name: types
#
#  id         :integer          not null, primary key
#  type_name  :string
#  system_id  :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
