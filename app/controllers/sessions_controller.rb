class SessionsController < ApplicationController
  def facebook
    binding.pry
    @user = User.find_or_create_from_omniauth(auth_hash)
    session[:user_id]= @user.id
    redirect_to '/'
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  def index
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
