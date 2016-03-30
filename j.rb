doc = Nokogiri::HTML(open("fm.html"))
doc.css('p').each_with_index do |par, index|
	if par.content == ""
		p "#{par.to_s}"
	end
end;0
