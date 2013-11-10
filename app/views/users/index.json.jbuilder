json.array!(@users) do |user|
  json.extract! user, :phone_number, :name, :email
  json.url user_url(user, format: :json)
end