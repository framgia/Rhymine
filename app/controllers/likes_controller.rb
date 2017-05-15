class LikesController < ApplicationController
  load_and_authorize_resource only: :destroy

  def create
    @song = Song.find_by id: params[:song_id]
    current_user.likes.create song: @song
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @song = @like.song
    @like.destroy
    respond_to do |format|
      format.js
    end
  end
end
