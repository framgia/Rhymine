class PagesController < ApplicationController
  def show
    if valid_page?
      @song_feeds = Song.feeds(current_user).order created_at: :desc
      render template: "pages/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private
  def valid_page?
    File.exist?(Pathname.new(Rails.root +
      "app/views/pages/#{params[:page]}.html.erb"))
  end
end
