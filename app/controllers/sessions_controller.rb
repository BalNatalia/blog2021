class SessionsController < ApplicationController
  def new
  end

  def create
<<<<<<< HEAD
    @user = User.find_by(login: params[:login])
    unless @user
      flash[:danger] = t('.user_not_found')
      redirect_to login_path
      return
    end
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: t('.success')
    else
      flash[:danger] = t('.invalid_password')
      redirect_to login_path
=======
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to root_path
    else
      redirect_to login_path, notice: 'Invalid username or password'
>>>>>>> 525814296584dd49da78dc598afcf50ee392fa23
    end
  end

  def destroy
    session.delete(:user_id)
<<<<<<< HEAD
    redirect_to root_path, notice: t('.success')
=======
    redirect_to root_path, notice: "Logged out"
>>>>>>> 525814296584dd49da78dc598afcf50ee392fa23
  end
end
