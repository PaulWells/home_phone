json.array!(@houses) do |house|
  json.extract! house, :house_name, :longitude, :latitude, :address, :phone_number
  json.url house_url(house, format: :json)
end