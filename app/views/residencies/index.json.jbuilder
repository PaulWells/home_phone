json.array!(@residencies) do |residency|
  json.extract! residency, :user_id, :house_id
  json.url residency_url(residency, format: :json)
end