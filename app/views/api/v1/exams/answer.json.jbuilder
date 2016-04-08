if @answer.nil?
	@status = "bad"
	@error = " can't load answer"
else
	@status = "OK"
	@error = "none"
end

json.status @status
json.error  @error
json.sample @topic.sample?
	
json.data  @answer

