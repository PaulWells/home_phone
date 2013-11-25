class WhosHomeJob

	def respond_to_whos_home(user)


		outstanding_request = user.whos_home_request
		user_responses = outstanding_request.whos_home_responses
		users_at_home = Array.new
		user_responses.each do |response|
			if response.is_home
				users_at_home.add response.user_id
			end
		end

		uri = URI.parse("https://android.googleapis.com/gcm/send")

		body.data = users_at_home
		registration_ids = Array.new
		user.registrations.each do |registration|
			registration_ids.push registration["registration_id"]
		end


		body.registration_ids = registration_ids
		body.time_to_live = 10
		body.dry_run = false
		logger.debug body.inspect
		puts body.inspect
		puts body.to_json

		request = Net::HTTP::Post.new(uri)
		request.body = body.to_json
		request["Authorization"] = "key=AIzaSyC02YIATAVSO-SIB562TIgkD3FmJLM7vuI"
		request["Content-Type"] = "application/json"

		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		response = http.request(request)
	
		case response
		when Net::HTTPSuccess, Net::HTTPRedirection
			logger.debug "successful network call"
			logger.debug response.body.inspect
			puts "successful network call"
			puts response.body.inspect

		else
			logger.debug response.value
			puts response.value

		end


		user_responses.delete
		outstanding_request.delete
	end
end
