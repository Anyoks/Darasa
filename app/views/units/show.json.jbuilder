exam_for_this_unit = []
@unit.exams.each do |exam|
	if exam.unit.name == @unit.name 
		exam_for_this_unit << exam
	end
end

if exam_for_this_unit.empty?
	@status = "OK"
	@error = "none"
	@message = "No questions"
end

if exam_for_this_unit
      @status = "OK"
      @error = "none"
    else
      @status = "bad"
      @error = " can't load questions"
end

json.status @status
json.error  @error
	
json.data  exam_for_this_unit do |exam|
	json.id exam.id
	json.title exam.title

	
end

