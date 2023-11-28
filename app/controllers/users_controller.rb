class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(username: params[:user][:username], email: params[:user][:email], password: params[:user][:password])
    # @user = User.new(allowed_user_params)

    if @user.save
      redirect_to new_user_path
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update!(:username => params[:user][:username], :email => params[:user][:email], :password => params[:user][:password])
        redirect_to new_user_path
      else 
        render :edit, status: :unprocessable_entity
      end
  end

  private
  
  def allowed_user_params
    params.require(:user).permit(:username, :email, :password)
  end
end