# == Schema Information
#
# Table name: sms
#
#  id         :uuid             not null, primary key
#  message    :text
#  phone      :string
#  mpesa_code :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  amount     :string
#  date       :string
#  time       :string
#  first_name :string
#  last_name  :string
#

class Sms < ActiveRecord::Base

	def extract text
		# text_message = Sms.new
		# text_message.message = text
		data = text.split
		data_parse_one = get_stuff data
		remove_unnecessary data_parse_one

		# convert to hash then save this in the db now
	end

	def get_stuff arr
		raw = arr[5].split('M')
		if raw[0] == "P"
			arr[4] = arr[4] + "PM"
		else
			arr[4] = arr[4] + "AM"
		end
		cash = arr[5].split('h')
		arr[5] = cash[1]
		last_name = arr[10].split(".")
		arr[10] = last_name[0]
		arr
	end

	# def remove_unnecessary arr
	# 	i = arr.length
	# 	while i > 11 do
	#  		result = arr.delete_at(-1)
	#   	i = arr.length
	# 	end
	# 	result
	# end

	def remove_unnecessary arr
		i = arr.length
		while i > 11 do
			result = arr.delete_at(-1)
			i = arr.length
		end
		arr.delete_at(1)
		p " just removed at 1 || #{arr} "
		arr.delete_at(2)
		p "  just removed at 2 ||  #{arr} "
		arr.delete_at(4)
		p "  just removed at 4 || #{arr} "
		arr.delete_at(4)
		p "  just removed at 5 ||  #{arr} "
		return arr
	end




end
