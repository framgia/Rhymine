class CommentsController < ApplicationController
  load_and_authorize_resource

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

  def edit
  end

  def update
    if @comment.update_attributes comment_params
      respond_to do |format|
        format.html{redirect_to @comment.song}
        format.js
      end
    else
      flash[:danger] = t "flash.danger.cannot_update"
      redirect_to @comment.song
    end
  end

  def destroy
    if @comment.destroy
      respond_to do |format|
        format.html{redirect_to @comment.song}
        format.js
      end
    else
      flash[:danger] = t "flash.danger.cannot_delete"
      redirect_to @comment.song
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content, :song_id
  end
end
