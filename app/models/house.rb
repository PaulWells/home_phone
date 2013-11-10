class House < ActiveRecord::Base
 
  has_many :residencies 
  has_many :users, through: :residencies
  validates :house_name, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :phone_number, length: {is: 10}, numericality: true
  
  
  
end
