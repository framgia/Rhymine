class Admins::GenresController < ApplicationController
  load_and_authorize_resource

  def index
    @genres = Genre.all.order created_at: :desc
    @genre = Genre.new
  end

  def create
    @genre = Genre.new genre_params
    if @genre.save
      respond_to do |format|
        format.html{redirect_to admins_genres_path}
        format.js
      end
    else
      render :new
    end
  end

  private
  def genre_params
    params.require(:genre).permit :name
  end
end
