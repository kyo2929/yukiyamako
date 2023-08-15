class Public::PostCommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    comment = current_customer.post_comments.new(post_comment_params)
    comment.post_id = @post.id
    comment.save
    redirect_to post_path(@post.id)
  end

  def destroy
    BookComment.find(params[:id]).destroy
    redirect_to request.referer
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
