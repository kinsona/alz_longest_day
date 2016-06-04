class Resource < ActiveRecord::Base

  belongs_to :story
  belongs_to :message
  
end
