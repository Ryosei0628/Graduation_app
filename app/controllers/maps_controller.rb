class MapsController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.includes(:user).page(params[:page])
  end
end
