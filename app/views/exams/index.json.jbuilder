json.array!(@exams) do |exam|
  json.extract! exam, :id, :title, :attachment, :date
  json.url exam_url(exam, format: :json)
end
