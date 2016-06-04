class Conversation < ActiveRecord::Base

  belongs_to :story
  has_many :messages
  belongs_to :user_one, class_name: 'User', foreign_key: 'user_one_id'
  belongs_to :user_two, class_name: 'User', foreign_key: 'user_two_id'

  accepts_nested_attributes_for :messages


  def partner(current_user_id)
    [self.user_one, self.user_two].select { |x| x.id != current_user_id }.first
  end


  def latest_message_datetime
    self.messages.last.created_at
  end

end
