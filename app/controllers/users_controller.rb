class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid? && @user.save
      log_in @user
      flash[:success] = "Welcome to the club"
      redirect_to @user
    else
      redirect_to @user    
    end
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
