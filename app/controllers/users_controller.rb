class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  def new
    @user = User.new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      if user = User.create(user_params)
        session[:user_id] = user.id
        redirect_to user
      else
        render :new
      end
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])
    if @user.pantries.empty?
      redirect_to new_pantry_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
