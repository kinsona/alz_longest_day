class Story < ActiveRecord::Base

  belongs_to :user
  has_many :resources
  has_many :conversations
  
end
