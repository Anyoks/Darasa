json.array!(@types) do |type|
  json.extract! type, :id, :type_name, :system_id
  json.url institution_types_url(type, format: :json)
end
