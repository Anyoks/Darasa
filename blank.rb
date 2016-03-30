# #Load the document as a Nokogiri object
# doc = Nokogiri::HTML(open("fm.html"))
# reg = /^(\\n|\\t)*$/
# img = []
# doc.css('p').each_with_index do |par, index|
# 	if par.content.blank?  #if it doesn't have text, it is a candidate for having an image.
# 		#if the content is not text, it could be an image tag
# 		if par.to_s.blank? #if there's no tag, move on to the next paragraph
# 			next
# 			#using regex doesn't work, \n tags are ignored. The trick here is to skip \n,\r,\t etc  #reg.match(par.text) 
# 		elsif par.text.length > 0 #An image tag has a length while a \n doesn't! :-)
# 			next
# 		else
# 			# you shall know the truth, and the truth shall make ou free" - Jesus in John 8:32
# 			# p "#{par.to_s}   |||  #{index}"
# 			img << par.to_s
# 		end
# 	else #if it's not blank, move on to the next one.
# 		next
# 	end
# end
# p "#{img}"

#Sanctification is a process. I happens as you obey the voice of the LORD
doc = Nokogiri::HTML(open("fm.html"))
reg = /^(\\n|\\t)*$/  #using regex doesn't work, \n tags are ignored. The trick here is to skip \n,\r,\t etc  #reg.match(par.text) 
img = []
doc.css('p').each_with_index do |par, index|
	#if it doesn't have text, it is a candidate for having an image &&
	 #if there's no tag, move on to the next paragraph.
	if par.content.blank? && !par.to_s.blank?  
			##** you shall know the truth, and the truth shall make ou free" - Jesus in John 8:32 **##
			# img << par.to_s unless par.to_s.split('img').length < 2
			p "#{par.to_s } || #{index}"  #unless par.to_s.split('img').length < 2
	end
end
p "#{img}"