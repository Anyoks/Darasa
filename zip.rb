def tables

	Zip::File.open("solution.zip") do |zipfile|
		zipfile.each do |entry|
			p "#{entry.name}"
		end
	
end
