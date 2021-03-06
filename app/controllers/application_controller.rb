class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # Includes Authorization mechanism
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Globally rescue Authorization Errors in controller.
  # Returning 403 Forbidden if permission is denied
  rescue_from Pundit::NotAuthorizedError, with: :permission_denied

  # Enforces access right checks for individuals resources
  after_filter :verify_authorized, :except => :index

  # Enforces access right checks for collections
  # after_filter :verify_policy_scoped, :only => :index

  def authenticate
    redirect_to login_url, alert: 'Please log in first' if current_user.nil?
  end

  # def can_administer?
  #   redirect_to root_url, alert: 'Access denied.' unless administrator?
  # end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def administrator?
    current_user && current_user.admin?
  end

  helper_method :administrator?

  def permission_denied
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end
end
