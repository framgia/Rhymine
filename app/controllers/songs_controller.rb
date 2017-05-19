class SongsController < ApplicationController
  load_and_authorize_resource
  before_action :load_genres, only: [:new, :edit]

  def index
    @songs = Song.search_song params[:search_param]
  end

  def new
    @song = Song.new
  end

  def create
    @song = current_user.songs.new song_params
    if @song.save
      flash[:info] = t "flash.info.upload_song_success"
      redirect_to current_user
    else
      load_genres
      render :new
    end
  end

  def show
    @comment = Comment.new
    @song.update_attributes views: (@song.views + 1)
  end

  def edit
  end

  def update
    if @song.update_attributes song_params
      flash[:success] = t "flash.success.updated"
      redirect_to @song
    else
      load_genres
      render :edit
      flash[:danger] = t "flash.danger.not_updated"
    end
  end

  def destroy
    if @song.destroy
      flash[:success] = t "flash.success.deleted"
    else
      flash[:danger] = t "flash.danger.not_deleted"
    end
    redirect_to current_user
  end

  private
  def song_params
    params.require(:song).permit :title, :artist, :description,
      :audio, :genre_id
  end

  def load_genres
    @genres = Genre.all
  end
end
