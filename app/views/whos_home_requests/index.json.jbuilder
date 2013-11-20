json.array!(@whos_home_requests) do |whos_home_request|
  json.extract! whos_home_request, :user_id, :num_recipients
  json.url whos_home_request_url(whos_home_request, format: :json)
end