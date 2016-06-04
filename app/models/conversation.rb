class Conversation < ActiveRecord::Base

  belongs_to :story
  has_many :messages
  belongs_to :user_one, class_name: 'User', foreign_key: 'user_one_id'
  belongs_to :user_two, class_name: 'User', foreign_key: 'user_two_id'

end
