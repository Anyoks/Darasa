def table
	doc = Docx::Document.open('fm.docx')
	question = []
	extra = []
	info = []
	regex = /\b^(QUESTION)\b\s[0-9]$/
	index = []
	temp = []
	space = " "



	doc.paragraphs.each_with_index do |par, index|
		next_paragraph_counter = 0
		
		if regex.match(par.to_s)
			puts "found it!! #{par.to_s}"
			next_paragraph_counter +=1
			temp << par.to_s + space
			next_par = doc.paragraphs[index+next_paragraph_counter]
			next_par_in_qn = next_par
			loop do
				
				if regex.match(next_par.to_s)	
					break
				else
					
						if regex.match(next_par_in_qn.to_s)
							break
						else
							p "The current paragraph #{index}"
							p "THE current par counter = #{next_paragraph_counter}"
							p "nxt par in this question itself XXXXX #{next_par_in_qn.to_s} XXXXXX "
							p " " 
							p " adding next par to array " 
							temp << next_par_in_qn.to_s 
							p " going to the next paragraph within a question"
							next_paragraph_counter +=1
							next_par_in_qn = doc.paragraphs[index+next_paragraph_counter]
							p " " 
							p " " 
							break if next_par_in_qn.to_s == "END"
						end
				end
			end
			question << temp.join + space
			temp.clear

		else
			p "I going to the next question"
		end
	end
	return question
end
