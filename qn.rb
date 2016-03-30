def table
	doc = Nokogiri::HTML(open("d.html"))

	tags = %w[p ol ul li h6 h5 h4 h3 h2 h1 em strong i b table thead tbody th tr td]

	nodes = doc.css(tags.join(', '))

	question = []
	regex = /\b^(QUESTION)\b\s[0-9]$/
	temp = []
	space = " "
	img = []

	nodes.each_with_index do |par, index|
		if regex.match(par.text.squish)
			question << temp.join unless temp.empty?
			temp.clear
			next
		elsif par.content == "END"
			question << temp.join unless temp.empty?
			break
		else
			temp << par.text
			next
		end
	end

	return question
end