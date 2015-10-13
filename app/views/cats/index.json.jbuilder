json.array!(@cats) do |cat|
  json.extract! cat, :id, :cat_name, :attachment, :date
  json.url cat_url(cat, format: :json)
end
