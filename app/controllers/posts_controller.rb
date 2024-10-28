class PostsController < ApplicationController
  def index
    @posts = post.includes(:user)
  end
end
