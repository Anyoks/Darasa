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
	# before_save :extract

	def extract text
		text_message = text
		data_raw = text.split
		if data_raw [1] == "Confirmed.on"
			data_parse_one = get_stuff data_raw
			data_parse_two = remove_unnecessary data_parse_one

			save_params = sms_params data_parse_two

			@sms = Sms.new(save_params)

			if @sms.save
				@sms.update_attribute(:message, text_message)
			else
				p "Error saving the message"
				false
			end
		else
			p "zzzzzzzzzzzzzzzz"
			false
		end
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

	def remove_unnecessary arr
		i = arr.length
		while i > 11 do
			result = arr.delete_at(-1)
			i = arr.length
		end
		arr.delete_at(1)
		arr.delete_at(2)
		arr.delete_at(4)
		arr.delete_at(4)
		return arr
	end

	def sms_params data
		name = ["mpesa_code", "date", "time", "amount", "phone", "first_name", "last_name"] 
		hash = Hash[*name.zip(data).flatten]
		return hash
	end

	def self.dedupe
	    # find all models and group them on keys which should be common
	    grouped = all.group_by{|sms| [ sms.mpesa_code ] }
	    grouped.values.each do |duplicates|
	      # the first one we want to keep right?
	      first_one = duplicates.shift # or pop for last one
	      # if there are any more left, they are duplicates
	      # so delete all of them
	      duplicates.each{|double| double.destroy} # duplicates can now be destroyed
	    end
	end

	def self.deduplicate
		duplicate_row_values = Sms.select('mpesa_code count(*)').group('mpesa_code').having('count(*) > 1').pluck('mpesa_code')

		duplicate_row_values.each do |mpesa_code|
			Sms.where(mpesa_code: mpesa_code).limit(100).order(id: :desc)[1..-1].map(&:destroy)	
		end
	end




end
