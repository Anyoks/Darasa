if @topics
      @status = "OK"
      @error = "none"
    else
      @status = "bad"
      @error = " can't load topics"
end

json.status @status
json.error  @error

json.data  @topics.each do |topic|
	json.id topic.id
	json.text topic.name
end
