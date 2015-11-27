if @exams.nil?
	@status = "bad"
	@error = " can't load questions"
else
	@status = "OK"
	@error = "none"
end

json.status @status
json.error  @error
	
json.data  @exams.each do |exam|
	exam.questions.each do |question|
		json.id question.id
		json.question question.question

		if question.response.nil?
			@text = "false"
			@video = "false"
		else if question.response.video.nil?
			@video = "false"
		else
			@text = "true"
			@video = "true"
		end
		end
		json.text @text
		json.video @video
		
	end
end