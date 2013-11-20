class WhosHomeResponse < ActiveRecord::Base
	belongs_to :whos_home_request

	attr_accessor :whos_home_request_id
	attr_accessor :user_id
	attr_accessor :is_home
end
