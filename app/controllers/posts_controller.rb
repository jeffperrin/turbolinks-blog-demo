class PostsController < ApplicationController
  def index
    @posts = Post.order('published_at DESC').all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private def post_params
    params.require(:post).permit(:title, :body, :published_at)
  end
end
