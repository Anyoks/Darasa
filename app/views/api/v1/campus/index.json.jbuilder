if @campus
      @status = "OK"
      @error = "none"
    else
      @status = "bad"
      @error = " can't load campus"
end

json.status @status
json.error  @error

json.data  @campus.each do |camp|
	json.id camp.id
	json.text camp.campus_name
end
