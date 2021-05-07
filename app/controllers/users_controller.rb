class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
    @user = User.new
  end

  def create
    puts 'i am now here'
    puts user_params[:name]
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
def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    user_params.permit(:name, :email,:password,:password_confirmation)
  end
end
end
