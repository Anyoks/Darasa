@status = "OK"
@error = "none"

if @resource.purchases.empty?
	json.status @status
	json.error  @error
	
	json.samples @samples.each do | sample|
		json.id  sample.id
		json.name  sample.name
		json.sample true
	end

	
else
	@status = "OK"
	@error = "none"

	json.status @status
	json.error  @error

	json.data @resource.purchases.each do | owned|
			json.id  owned.topic_id
			json.name  owned.topic.name
			json.sample false
	end

	json.samples @samples.each do | sample|
			json.id  sample.id
			json.name  sample.name
			json.sample true
	end
end


