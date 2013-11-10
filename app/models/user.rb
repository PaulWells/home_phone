class User < ActiveRecord::Base
  has_many :residencies
  has_many :houses, through: :residencies
  
end
