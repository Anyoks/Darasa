# == Schema Information
#
# Table name: sms
#
#  id         :uuid             not null, primary key
#  message    :text
#  phone      :string
#  code       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sms < ActiveRecord::Base
end
