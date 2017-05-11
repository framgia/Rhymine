class SongsController < ApplicationController
  load_and_authorize_resource
  before_action :find_song, only: [:show]

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
  end

  private
  def song_params
    params.require(:song).permit :title, :artist, :description,
      :audio, :genre_id
  end

  def find_song
    @song = Song.find_by id: params[:id]
    if @song.nil?
      flash[:danger] = t "flash.danger.song_not_existed"
      redirect_to root_path
    end
  end
end
