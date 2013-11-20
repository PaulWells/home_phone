class WhosHomeRequest < ActiveRecord::Base
	belongs_to :user
	has_many :whos_home_responses

	attr_accessor :user_id
	attr_accessor :num_recipients
end
