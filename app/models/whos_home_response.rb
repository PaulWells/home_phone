class WhosHomeResponse < ActiveRecord::Base
	belongs_to :whos_home_request

	attr_accessor :is_home
end
