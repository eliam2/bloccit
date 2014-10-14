class CommentsController < ApplicationController
  respond_to :html, :js

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    authorize @comment

    @topic = @post.topic

    if @comment.save
       flash[:notice] = "Comment was saved."
       redirect_to [@post.topic, @post]
    else
       flash[:error] = "There was an error saving the comment. Please try again."
       redirect_to [@post.topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = Comment.find(params[:id])
    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment was deleted."
    else
      flash[:error] = "There was an error deleting the comment. Please try again."
    end

    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post] }
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
end
