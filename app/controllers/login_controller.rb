class LoginController < ApplicationController

  before_action :redirect_user, except: 'destroy'

  def new
  end
  def create
    user = User.find_by_email(params[:email])
    if user &&  user.authenticate(params[:password])
      reset_session
      session[:user_id] = user.id
      redirect_to books_path
    else
      redirect_to login_path, alert: t('flash.login.create.alert')
    end
  end
  def destroy
    reset_session
    redirect_to login_path
  end
end
