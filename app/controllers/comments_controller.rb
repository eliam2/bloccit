class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    @favorite = 
    authorize @comment

    @topic = @post.topic

    if @comment.save
       flash[:notice] = "Comment was saved."
       #@post.favorites.each do |favorite|
       # FavoriteMailer.new_comment(favorite.user, @post, self).deliver
       #end
       redirect_to [@topic, @post]
    else
       flash[:error] = "There was an error saving the comment. Please try again."
       redirect_to [@topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = Comment.find(params[:id])
    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment was deleted."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error deleting the comment. Please try again."
      redirect_to [@topic, @post]
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
end
