json.data 
	json.user_id     @resource.id
	json.first_name  @resource.first_name
	json.second_name @resource.second_name
	json.email       @resource.email
	json.topics @resource.purchases.each do | owned|
		json.id  owned.topic_id
		json.name  owned.topic.name
end
