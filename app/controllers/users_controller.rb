class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def discover
    @user = User.find(params[:user_id])
  end

  def create
    user = User.new(user_params)

    if user_params[:password] == user_params[:password_confirmation]
      user.save
      redirect_to user_path(user), notice: 'User created successfully'
    else
      flash.now[:alert] = 'Passwords must match'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def login_form; end

  def login_user
    # require 'pry';binding.pry
    user = User.find_by(email: params[:email])

    # provided to us from has_secure_password on user models
    if user.authenticate(params[:password])
      flash[:success] = "Welcome, #{user.name}"
      redirect_to user_path(user)
    else
      flash[:error] = 'Sorry, wrong password'
      render :login_form
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
