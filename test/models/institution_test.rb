# == Schema Information
#
# Table name: institutions
#
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  id         :uuid             not null, primary key
#  deleted_at :datetime
#  country    :string
#  type_id    :uuid
#

require 'test_helper'

class InstitutionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
