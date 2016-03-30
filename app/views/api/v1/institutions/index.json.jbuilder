if @institutions
      @status = "OK"
      @error = "none"
    else
      @status = "bad"
      @error = " can't load institutions"
end

json.status @status
json.error  @error

json.data  @institutions.each do |institution|
	json.id institution.id
	json.text institution.name
end
