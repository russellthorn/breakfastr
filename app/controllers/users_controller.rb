class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # password stuff here
    if @user.save
      flash[:success] = "Thanks for signing up"
      # log them in here
      reset_session
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:error] = "oops"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Successfully updated #{@user.username}"
      redirect_to root_path
    else
      flash[:error] = "oops"
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:success] = "User #{user} destroyed"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)
  end
end
