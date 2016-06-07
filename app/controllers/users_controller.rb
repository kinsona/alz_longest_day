class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = "Profile updated!"
      redirect_to @user
    else
      flash.now[:warning] = "Oops! Try again."
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:age, :zip_code, :stage, :relationship)
    end

end
