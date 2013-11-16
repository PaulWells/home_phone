json.array!(@registrations) do |registration|
  json.extract! registration, :registration_id, :user_id
  json.url registration_url(registration, format: :json)
end