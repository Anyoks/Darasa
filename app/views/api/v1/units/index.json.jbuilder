if @units
      @status = "OK"
      @error = "none"
    else
      @status = "bad"
      @error = " can't load units"
end

json.status @status
json.error  @error

json.data  @units.each do |unit|
	json.id unit.id
	json.text unit.name
end
