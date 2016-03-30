def table
	doc = Nokogiri::HTML(open("with_table.html"))

	question = []
	extra = []
	info = []
	regex =/\b^(QUESTION)\b\s\d+$/
	index = []
	temp = []
	space = " "
	even_temp =[]

	doc.css('p').each_with_index do |par, index|
		next_paragraph_counter = 0
		
		if regex.match(par.text.squish)
			puts "found a QUESTION!! #{par.text}"
			next_paragraph_counter +=1
			temp << par.to_html + space
			next_par = doc.css('p')[index+next_paragraph_counter]
			next_par_in_qn = next_par
			loop do
				
				if regex.match(next_par_in_qn.text.squish)	
					break
				else
					
						if regex.match(next_par_in_qn.text.squish)
							break
						# elsif next_par_in_qn.parent.parent.parent.name == 'table'
						# 	p "found a table"
						# 	break
						else
							# p "The current paragraph #{index}"
							# p "THE current par counter = #{next_paragraph_counter}"
							# p "THE CURRENT PARA #{par.to_s}"
							# p "nxt par in this question itself XXXXX #{next_par_in_qn.to_s} XXXXXX "
							# p "OOOOOOOOOOOOOOOOOOO"
							# p "Unsquished text #{next_par_in_qn.inner_html}"
							# p "squished text #{next_par_in_qn.content.squish}"
							# p "OOOOOOOOOOOOOOOOOOO"
							# p " " 
							# p " adding next par to array "

							# if par.content == ""
							# 		p "#{par.to_s}"
							# end
							if next_par_in_qn.parent.parent.parent.name == 'table'
							# even_temp.clear
								loop { 

									p "next item in table #{next_par_in_qn.to_s}"
									even_temp << next_par_in_qn.parent.parent.parent.to_html
									break if  next_par_in_qn.parent.parent.parent.name != 'table' 
									next_paragraph_counter +=1
									next_par_in_qn = doc.css('p')[index+next_paragraph_counter]
									# break if  next_par_in_qn.parent.parent.parent.name != 'table' 
								 }
								p "Temp Loop Length  #{even_temp.length}"
							# temp << even_temp.last
							else
								if even_temp.last.nil?
									p "Temp nill Length  #{even_temp.length}"
									temp << next_par_in_qn.to_html #+ even_temp.last
								else
									p "IN HERE!!! IN HERE!!!!  #{even_temp.length}"

									temp << even_temp.last + next_par_in_qn.to_html 
									even_temp.clear
								end
							end

							# next_par_in_qn.content = next_par_in_qn.content.squish!
							
							# p " going to the next paragraph within a question"
							# next_paragraph_counter +=1
							# next_par_in_qn = doc.css('p')[index+next_paragraph_counter]
							# p " " 
							# p " " 
							break if next_par_in_qn.text.squish == "END" || next_paragraph_counter == doc.css('p').count || regex.match(next_par_in_qn.text.squish )
							next_paragraph_counter +=1
							next_par_in_qn = doc.css('p')[index+next_paragraph_counter]
							
							
						end
				end
			end
			question << temp.join + space

			temp.clear

		else
			# p "I'm going to the next question"
			# 	if par.content == ""
			# 						p "#{par.to_s}"
			# 	end
			next
		end
	end
	return question
end