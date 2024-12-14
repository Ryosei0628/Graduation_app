class MyPagesController < ApplicationController
  def show
    @user = current_user
    @posts = current_user.posts
  end
end
