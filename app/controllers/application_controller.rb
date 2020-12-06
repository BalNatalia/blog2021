class ApplicationController < ActionController::Base
  before_action :load_current_user

<<<<<<< HEAD
  private

  def load_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def check_authentication
    render_error unless @current_user
  end

  def render_error(error = t('helpers.forbidden'))
    @error = error
    render 'error', status: 403
=======
  def load_current_user
    @current_user = User.find_by id: session[:user_id]
>>>>>>> 525814296584dd49da78dc598afcf50ee392fa23
  end
end
