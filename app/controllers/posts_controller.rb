class PostsController < ApplicationController
  def index
    @posts = Post.order('published_at DESC, updated_at DESC').all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new(published_at: Date.today)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_url, notice: "'#{@post.title}' was created."
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to posts_url, notice: "'#{@post.title}' was updated."
    else
      render :edit
    end
  end

  private def post_params
    params.require(:post).permit(:id, :title, :body, :published_at)
  end
end
