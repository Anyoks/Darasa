doc = Docx::Document.open('test.docx')
question = []
info = []
regex = /\b^(QUESTION)\b\s[0-9]$/
qn = 0

doc.paragraphs.each_with_index do |par, index|
	case
		when regex.match(par.to_s)
		puts "correct! index #{index}"
		question.push $1
		info << "just pushed a value"
		end

end
puts " the question stack #{question}"

puts "the infor stack #{info}"

puts "#{qn}"

		
