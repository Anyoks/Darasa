if @resource.purchases.nil?
	@status = "bad"
	@error = "Doesn't own any topics"
else
	@status = "OK"
	@error = "none"
end

json.status @status
json.error  @error
json.data @resource.purchases.each do | owned|
	json.id  owned.topic_id
	json.name  owned.topic.name
end
