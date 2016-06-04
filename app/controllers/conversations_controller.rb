class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @conversation = Conversation.new(story_id: params[:story_id], user_one_id: params[:story_author_id], user_two: current_user)
    @message = @conversation.messages.build(user: current_user)
  end


  def create
    @conversation = Conversation.new(convo_params)
    @conversation.user_two = current_user

    if @conversation.save
      flash[:success] = "Conversation started!"
      redirect_to @conversation.story
    else
      flash.now[:warning] = "Oops! Try again."
      render :new
    end
  end


  def index
  end


  def show
  end


    private

    def new_convo_params
      params.require(:conversation).permit(:story_id, :user_one_id)
    end

end
