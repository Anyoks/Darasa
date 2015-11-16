# == Schema Information
#
# Table name: cats
#
#  id         :integer          not null, primary key
#  cat_name   :string
#  attachment :string
#  date       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  unit_id    :integer          default(3)
#

require 'test_helper'

class CatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
