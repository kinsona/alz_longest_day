class Message < ActiveRecord::Base

  belongs_to :conversation
  belongs_to :user
  has_one :resource
  
  accepts_nested_attributes_for :resource

end
