class CommentsController < ApplicationController

  def create
    line = Line.find(params[:line_id])
    comment = current_user.comments.new(comment_params)
    comment.line_id = line.id
    if comment.save
      redirect_to request.referer
    else
      render line_path(line.id)
    end
  end
  
  def destroy
    line = Line.find(params[:line_id])
    comment = Comment.find_by(id: params[:id], line_id: params[:line_id])
    if comment.user_id == current_user.id
      comment.destroy
      redirect_to request.referer
    end
  end
  
  protected
  def comment_params
    params.require(:comment).permit(:line_comment)
  end

end
