json.array!(@campus) do |campu|
  json.extract! campu, :id, :campus_name, :location, :institution_id
  json.url campu_url(campu, format: :json)
end
