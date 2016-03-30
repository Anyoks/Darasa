if @courses
      @status = "OK"
      @error = "none"
    else
      @status = "bad"
      @error = " can't load courses"
end

json.status @status
json.error  @error

json.data  @courses.each do |course|
	json.id course.id
	json.text course.name
end
