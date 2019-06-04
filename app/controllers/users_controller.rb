class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if user = User.create(user_params)
      session[:user_id] = user.id
      redirect_to pantry(new)
    else
      render :new
    end
  end
end
