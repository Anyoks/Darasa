json.array!(@responses) do |response|
  json.extract! response, :id, :response
  json.url response_url(response, format: :json)
end
