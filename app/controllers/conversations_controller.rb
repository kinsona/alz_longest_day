class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @conversation = Conversation.new(story_id: params[:story_id], user_one_id: params[:story_author_id], user_two: current_user)
    @message = @conversation.messages.build(user: current_user)
    @resource = @message.build_resource(story_id: params[:story_id])
  end


  def create
    @conversation = Conversation.new(convo_params)
    @conversation.user_two = current_user
    @conversation.messages.last.user_id = current_user.id
    @conversation.messages.last.resource.story_id = @conversation.story_id

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

    def convo_params
      params.require(:conversation).permit( :story_id,
                                            :user_one_id,
                                            :messages_attributes => [:body, :resource_attributes => [:body]] )
    end

end
