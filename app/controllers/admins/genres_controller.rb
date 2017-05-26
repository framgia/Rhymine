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

  def edit
  end

  def update
    if @genre.update_attributes genre_params
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = t "flash.danger.cannot_update"
      redirect_to admins_genres_path
    end
  end

  def destroy
    if @genre.destroy
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = t "flash.danger.not_deleted"
      redirect_to admins_genres_path
    end
  end

  private
  def genre_params
    params.require(:genre).permit :name
  end
end
