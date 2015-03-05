class SessionsController < ApplicationController
  def new
  end

  def create
    username = params[:session][:username]
    password = params[:session][:password]
    @user = User.find_by(username: username)
    # @user = User.find_by(username: name of column, @username name of user)
    if @user.present? and @user.authenticate(password)
      flash[:success] = "Now logged in"
      # log them in
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:error] = "Wrong"
      render :new
    end
  end

  def show
  end

  def destroy
    reset_session
    flash[:success] = "laters pal"
    redirect_to root_path
  end
end
