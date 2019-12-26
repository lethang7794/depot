class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      session[:name] = params[:name]
      redirect_to login_url, alert: "Wrong password, please try again."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_index_url
  end
end
