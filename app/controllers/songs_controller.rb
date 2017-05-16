class SongsController < ApplicationController
  load_and_authorize_resource

  def index
    @songs = Song.search_song params[:search_param]
  end

  def new
    @song = Song.new
    @genres = Genre.all
  end

  def create
    @song = current_user.songs.new song_params
    if @song.save
      flash[:info] = t "flash.info.upload_song_success"
      redirect_to current_user
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @song.update_attributes views: (@song.views + 1)
  end

  private
  def song_params
    params.require(:song).permit :title, :artist, :description,
      :audio, :genre_id
  end
end
