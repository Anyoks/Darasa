if @types
      @status = "OK"
      @error = "none"
    else
      @status = "bad"
      @error = " can't load types"
end

json.status @status
json.error  @error

json.data  @types.each do |type|
	json.id type.id
	json.text type.type_name
end
