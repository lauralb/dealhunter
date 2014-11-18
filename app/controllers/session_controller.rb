class SessionController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.__id__
    redirect_to root_url
  end
end