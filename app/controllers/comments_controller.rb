class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new comment_params
    if @comment.save
      respond_to do |format|
        format.html{redirect_to @comment.song}
        format.js
      end
    else
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content, :song_id
  end
end
