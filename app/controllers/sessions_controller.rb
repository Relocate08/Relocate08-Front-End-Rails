class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by(uid: request_hash[:uid])
    user.uid = request_hash[:uid]
    user.token = request_hash[:credentials][:token]
    user.name = request_hash[:info][:name]
    user.email = request_hash[:info][:email]
    user.save
    session[:user_id] = user.id
    flash[:success] = "You are now logged in!"
    redirect_to dashboard_path
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = 'You have been logged out!'
    redirect_to root_path
  end

  private
  def request_hash
    request.env['omniauth.auth']
  end
end
