def table
	doc = Nokogiri::HTML(open("d.html"))

	# tags = %w[p ul li h6 h5 h4 h3 h2 h1 em strong i b table thead tbody th tr td]
	tags = %w[p h6 h5 h4 h3 h2 h1 em strong i b table thead tbody th tr td]

	# doc.css('p') = doc.css(tags.join(', '))

	question = []
	extra = []
	info = []
	regex = /\b^(QUESTION)\b\s[0-9]$/
	index = []
	temp = []
	space = " "
	img = []
	q = []

	doc.css('p').each_with_index do |par, index| #Go throug all paragraph tags and process each paragraph one at at time
		next_paragraph_counter = 0
		
		if regex.match(par.text.squish) #If the current paragraph's content is QUESTION x we have found a question, read everything till you find QUESTION X
			next_paragraph_counter +=1
			# puts "found a QUESTION!! #{par.text}  || index  #{index}  || counter #{next_paragraph_counter}"
			# temp << par.text + space
			next_par = doc.css('p')[index+next_paragraph_counter]
			next_par_in_qn = next_par
			

			# p"#{next_par.to_s}  || #{index}"

			loop do
				
				# p"#{next_par.text}  || index  #{index} || counter #{next_paragraph_counter}"
				if regex.match(next_par_in_qn.text.squish)
					# p"#{next_par.content}  || #{index}"
					break
					# next
				else
					# temp << next_par.to_html
						# p"#{next_par_in_qn}  || index  #{index} || counter #{next_paragraph_counter}"
						if next_par_in_qn.nil? || regex.match(next_par_in_qn.text.squish )
							##** Evil shall slay the wicked: and they that hate the righteous shall be desolate - Psalm 34:21 **##
							puts "found  #{par.text.squish} !! || index  #{index}  || counter #{next_paragraph_counter}"
							break
						else
							p " The current paragraph AAAAAAAAAA #{par.text.squish}"
							if next_par_in_qn.content.blank? && !next_par_in_qn.to_s.blank?  
								##** you shall know the truth, and the truth shall make ou free" - Jesus in John 8:32 **##
								temp << next_par_in_qn.to_html unless next_par_in_qn.to_s.split('img').length < 2
								img << next_par_in_qn.to_s unless next_par_in_qn.to_s.split('img').length < 2
							end

							# next_par_in_qn.content = next_par_in_qn.content.squish!
							# p"inserting into temp array   #{next_par_in_qn.text}  || #{index} || #{next_paragraph_counter}  "
							# temp << next_par_in_qn.to_html unless regex.match(next_par_in_qn.text.squish )
							# next
							##**Oh let the wickedness of the wicked come to an end; but establish the just: **##
							##**for the righteous God trieth the hearts and reins. - Psalm 7:9**##

							next_par_in_qn.content = next_par_in_qn.content.squish!
							p"inserting into temp array the next paragraph  #{next_par_in_qn.text}  || #{index} || #{next_paragraph_counter}  "
							temp << next_par_in_qn.to_html 

							break if next_par_in_qn.content == "END" || index ==  doc.css('p').count 
							next_paragraph_counter +=2
							next_index = index+next_paragraph_counter
							p " NEXT INDEX #{next_index}"
							# break if next_index >=  doc.css('p').count 
							next_par_in_qn = doc.css('p')[index+next_paragraph_counter]
							# break if next_par_in_qn.content == "END" || next_paragraph_counter ==  doc.css('p').count || regex.match(next_par_in_qn.text.squish )
					

							p"next paragraph is WWWWWW  #{next_par_in_qn.text.squish}  || #{index} || #{next_paragraph_counter}  " unless  next_par_in_qn.nil?
						
							# break if next_par_in_qn.nil? || regex.match(next_par_in_qn.text.squish)
							# p "Next paragraph in question   === #{next_par_in_qn.text}"

							# next_par = doc.css('p')[index+next_paragraph_counter]
							next
						end
					next
				end
			end
			p "#{temp.join}"
			# q = temp.first, temp.last
			question <<temp.join + space
			# q.clear
			temp.clear
		else
			##** Jesus saith unto him, I am the way, the truth and the life, no man cometh unto the Father but by me - John 14:6 **##
			next
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
