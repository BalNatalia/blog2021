class UsersController < ApplicationController
<<<<<<< HEAD
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_edit, only: [:edit, :update, :destroy]

  # GET /users
  def index
    @users = User.ordering.page(params[:page])
  end

  # GET /users/1
  def show
    @posts = @user.posts.includes(:user).page(params[:page])
=======
  before_action :check_admin
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
>>>>>>> 525814296584dd49da78dc598afcf50ee392fa23
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
<<<<<<< HEAD
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: t('.success')
    else
      render :new
=======
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
>>>>>>> 525814296584dd49da78dc598afcf50ee392fa23
    end
  end

  # PATCH/PUT /users/1
<<<<<<< HEAD
  def update
    if @user.update(user_params)
      redirect_to @user, notice: t('.success')
    else
      render :edit
=======
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
>>>>>>> 525814296584dd49da78dc598afcf50ee392fa23
    end
  end

  # DELETE /users/1
<<<<<<< HEAD
  def destroy
    @user.destroy
    redirect_to users_path, notice: t('.success')
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:login, :name, :password, :password_confirmation)
  end

  def check_edit
    render_error unless @user.edit_by?(@current_user)
  end
=======
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :name, :admin)
    end

    def check_admin
      unless @current_user && @current_user.admin
        redirect_to root_path, notice: 'Доступ запрещён'
      end
    end
>>>>>>> 525814296584dd49da78dc598afcf50ee392fa23
end
