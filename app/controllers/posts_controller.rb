class PostsController < ApplicationController
  def index
    scope = Post.order('published_at DESC, updated_at DESC').all
    if params[:search].present?
      q = "%#{params[:search]}%"
      scope = scope.where('posts.title LIKE ? OR posts.body LIKE ?', q, q)
    end

    @posts = scope
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
      render :new, change: 'post-form'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to posts_url, notice: "'#{@post.title}' was updated."
    else
      render :edit, change: 'post-form'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url, change: 'posts', notice: 'That post and all its comments have been UTTERLY DESTROYED.'
  end

  private def post_params
  params.require(:post).permit(:id, :title, :body, :published_at)
end
end
