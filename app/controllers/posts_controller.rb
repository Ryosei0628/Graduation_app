class PostsController < ApplicationController
    skip_before_action :require_login, only: %i[index]
  def index
    @posts = Post.includes(:user)
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, success: t('posts.create.success', item: Post.model_name.human)
    else
      flash.now[:danger] = t('posts.create.failure', item: Post.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:location_name, :address, :start_hour, :start_minute, :end_hour, :end_minute, :description, :wifi, :electricity, :site_url, :genre, :quiet_level, :post_image, :post_image_cache)
  end
end
