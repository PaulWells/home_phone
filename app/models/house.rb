class House < ActiveRecord::Base
 
  has_many :residencies 
  has_many :users, through: :residencies
 
end
