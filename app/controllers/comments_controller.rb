class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.valid? 
      @comment.save
      ActionCable.server.broadcast "comment_channel", content: @comment
    else
      redirect_to item_path(@comment.item)
    end
  end
  

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
