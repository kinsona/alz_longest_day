class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = current_user.messages.build(message_params)

    if @message.save
      flash[:success] = "Message sent!"
    else
      flash.now[:warning] = "Oops! Try again."
    end
    
    redirect_to @message.conversation
  end


  private

    def message_params
      params.require(:message).permit(:body, :conversation_id)
    end
end
