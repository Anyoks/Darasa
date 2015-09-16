json.array!(@topics) do |topic|
  json.extract! topic, :id, :name, :code, :attachment
  json.url topic_url(topic, format: :json)
end
