class User < ActiveRecord::Base
  has_many :residencies
  has_many :houses, through: :residencies
  
  validates :phone_number, presence: true, numericality: true
  validates :name, presence: true
  
end
