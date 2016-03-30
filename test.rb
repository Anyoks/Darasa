def table
	doc = Nokogiri::HTML(open("d.html"))

	tags = %w[p ol ul li h6 h5 h4 h3 h2 h1 em strong i b table thead tbody th tr td]

	nodes = doc.css(tags.join(', '))

	question = []
	extra = []
	info = []
	regex = /\b^(QUESTION)\b\s[0-9]$/
	index = []
	temp = []
	space = " "
	img = []
	q = []

	nodes.each_with_index do |par, index| #Go throug all paragraph tags and process each paragraph one at at time
		next_paragraph_counter = 0
		
		if regex.match(par.text.squish) #If the current paragraph's content is QUESTION x we have found a question, read everything till you find QUESTION X
			puts "found  #{par.text.squish} !! || index  #{index}  || counter #{next_paragraph_counter}"
			question << temp.join + space unless temp.empty?
			temp.clear
			next
		else
			##** Jesus saith unto him, I am the way, the truth and the life, no man cometh unto the Father but by me - John 14:6 **##
			par.content = par.content.squish!
			temp << par.to_html
			
			##**Oh let the wickedness of the wicked come to an end; but establish the just: **##
			##**for the righteous God trieth the hearts and reins. - Psalm 7:9**##

			break if par.content == "END" 

		end
	end

	# puts "#{temp}"
	# p " " 
	# puts "#{question[3]}"
	return question
end

# puts "#{question.length}"
# p "#{space}"
# p "#{space}"
# p "#{img.length}"
# p "#{img[1]}"
# p "#{img[2]}"
