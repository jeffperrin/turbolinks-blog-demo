class PostsController < ApplicationController
  def index
    @posts = Post.order('published_at DESC').all
  end
end
