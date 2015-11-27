if @exams
      @status = "OK"
      @error = "none"
    else
      @status = "bad"
      @error = " can't load exams"
end

json.status @status
json.error  @error

json.data  @exams.each do |exam|
	json.id exam.id
	json.text exam.title
end


