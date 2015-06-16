class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params)

    if @comment.save
      redirect_to post_url(@comment.post), change: 'comments', notice: "Comment created."
    else
      render :new, change: 'comment-form'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to post_url(@comment.post), change: 'comments', notice: 'The comment has been eliminated'
  end

  private def comment_params
  params.require(:comment).permit(:id, :commenter_name, :body, :post_id)
end
end
