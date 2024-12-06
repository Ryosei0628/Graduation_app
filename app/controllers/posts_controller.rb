class PostsController < ApplicationController
    skip_before_action :require_login, only: %i[index show]
  def index
    page = params[:page].to_i > 0 ? params[:page].to_i : 1
    q = params[:q].to_s.strip
    @q = Post.ransack(params[:q])
    @posts = @q.result.includes(:user).page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, success: t("defaults.flash_message.created", item: Post.model_name.human)
    else
      flash.now[:danger] = t("defaults.flash_message.not_created", item: Post.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), success: t("defaults.flash_message.updated", item: Post.model_name.human)
    else
      flash.now[:danger] = t("defaults.flash_message.not_updated", item: Post.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy!
    redirect_to posts_path, success: t("defaults.flash_message.deleted", item: Post.model_name.human), status: :see_other
  end

  def bookmarks
    page = params[:page].to_i > 0 ? params[:page].to_i : 1
    q = params[:q].to_s.strip
    @q = current_user.bookmark_posts.ransack(params[:q])
    @bookmark_posts = @q.result.page(params[:page])  # 検索結果の取得
  end

  private
  def post_params
    params.require(:post).permit(:location_name, :address, :start_hour, :start_minute, :end_hour, :end_minute, :description, :wifi, :electricity, :site_url, :genre, :quiet_level, :post_image, :post_image_cache)
  end
end
