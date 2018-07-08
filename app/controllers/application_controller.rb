class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    if !session[:access_token]
      @current_user = Instagram.get_access_token(params[:code], redirect_uri: ENV['REDIRECT_URI'])
      session[:access_token] = @current_user.access_token
      flash[:success] = "Welcome to Showoff Test - Instagram Authentication"
      @current_user
    end
  end
end
