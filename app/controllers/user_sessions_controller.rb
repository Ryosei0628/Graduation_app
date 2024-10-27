class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  
  
    def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to root_path, success: t('user_session.create.success') 
    else
      flash.now[:danger] = t('user_session.create.failure') 
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other, success: t('user_session.destroy.success') 
  end
end
