class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def current_user
    return nil if cookies[:name].blank?
    User.find_by_name(cookies[:name])
  end

  def build_cookie(user)
    cookies[:name] = user.name
  end

  def destroy_cookie
    cookies.delete(:name)
  end
end
