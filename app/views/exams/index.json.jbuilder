json.array!(@exams) do |exam|
  json.extract! exam, :id, :exam_name, :attachment, :date
  json.url exam_url(exam, format: :json)
end
