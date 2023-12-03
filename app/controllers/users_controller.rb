class UsersController < ApplicationController
  def new
  end
  
  def discover
    # require 'pry';binding.pry
    @user = User.find(params[:user_id])
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to user_path(user), notice: "User created successfully"
    else
      flash.now[:alert] = user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email)
  end
end