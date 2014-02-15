class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:session][:username])
    valid_pwd = user.authenticate(params[:session][:password])
    if user && valid_pwd
      user.increment_count
      sign_in user
      redirect_to user
    else
      if !user
        flash[:error] = '(ERR_BAD_USERNAME)'
      else
        flash[:error] = '(ERR_BAD_CREDENTIALS)'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
