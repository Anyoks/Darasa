doc = Nokogiri::HTML(open("fm.html"))
tags = %w[table]
nodes = doc.css(tags.join(', '))

output = []
nodes.each_with_index do |node, index|
		p "#{node}  || #{index}"
	output << [
		"<#{ node.name }",
		node.attributes.map { |param| '%s="%s"' % [param[0], param[1]] }.join(' '),
		'>'
	].join
	output << node.children.to_s.gsub(/[\s.!?]/, '|\0|').split('|').flatten
	output << "</#{ node.name }>"
end

# p "#{output}"
