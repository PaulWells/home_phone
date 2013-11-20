json.array!(@whos_home_responses) do |whos_home_response|
  json.extract! whos_home_response, :whos_home_request_id, :user_id, :is_home
  json.url whos_home_response_url(whos_home_response, format: :json)
end