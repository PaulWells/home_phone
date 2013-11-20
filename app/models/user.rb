class User < ActiveRecord::Base
  has_many :residencies
  has_many :houses, through: :residencies
	has_many :registrations
	has_one :whos_home_request
  
  validates :phone_number, presence: true, numericality: true
  validates :name, presence: true
  
end
