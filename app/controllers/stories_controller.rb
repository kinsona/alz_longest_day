class StoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @stories = Story.all
  end


  def new
    @story = current_user.stories.build
  end


  def create
    @story = current_user.stories.build(story_params)

    if @story.save
      flash[:success] = "Story created!"
      redirect_to @story
    else
      flash.now[:danger] = "Oops!  Try again."
      render :new
    end
  end


  def show
    @story = Story.find(params[:id])
  end


  private

    def story_params
      params.require(:story).permit(:mood, :body)
    end


end
