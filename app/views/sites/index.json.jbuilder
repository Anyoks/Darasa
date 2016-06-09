json.array!(@sites) do |site|
  json.extract! site, :id, :email
  json.url site_url(site, format: :json)
end
