def table

	doc = Nokogiri::HTML(open("d.html"))

	question = []
	extra = []
	info = []
	regex = /\b^(QUESTION)\b\s[0-9]$/
	index = []
	temp = []
	space = " "
	img = []

	doc.css('p').each_with_index do |par, index| #Go throug all paragraph tags and process each paragraph one at at time
		next_paragraph_counter = 0
		
		if regex.match(par.text.squish) #If the current paragraph's content is QUESTION x we have found a question, read everything till you find QUESTION X
			puts "found a QUESTION!! #{par.text}"
			next_paragraph_counter +=1
			# temp << par.text + space
			next_par = doc.css('p')[index+next_paragraph_counter]
			next_par_in_qn = next_par

			loop do
				
				
				if regex.match(next_par.content)
					break
				else
					
						if next_par_in_qn.nil?  || regex.match(next_par_in_qn.content)
							##** Evil shall slay the wicked: and they that hate the righteous shall be desolate - Psalm 34:21 **##
							break
						else
							if next_par_in_qn.content.blank? && !next_par_in_qn.to_s.blank?  
								p "#{next_par_in_qn.to_s}" unless next_par_in_qn.to_s.split('img').length < 2
								##** you shall know the truth, and the truth shall make ou free" - Jesus in John 8:32 **##
								temp << next_par_in_qn.to_s unless next_par_in_qn.to_s.split('img').length < 2
								img << next_par_in_qn.to_s unless next_par_in_qn.to_s.split('img').length < 2
							end

							next_par_in_qn.content = next_par_in_qn.content.squish!
							temp << next_par_in_qn.to_html
							
							##**Oh let the wickedness of the wicked come to an end; but establish the just: **##
							##**for the righteous God trieth the hearts and reins. - Psalm 7:9**##

							break if next_par_in_qn.content == "END" || next_paragraph_counter == doc.css('p').count
							next_par_in_qn = doc.css('p')[index+next_paragraph_counter]
							next_paragraph_counter +=1
						end
				end
			end
			question << temp.join + space
			temp.clear
		else
			##** Jesus saith unto him, I am the way, the truth and the life, no man cometh unto the Father but by me - John 14:6 **##
			next
		end
	end
	
	return question
end