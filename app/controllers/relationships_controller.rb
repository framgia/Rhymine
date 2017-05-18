class RelationshipsController < ApplicationController
  def index
    @user = User.find_by id: params[:user_id]
    @title = params[:type]
    if ["following", "followers"].include? params[:type]
      @users = @user.send(params[:type])
        .paginate page: params[:page], per_page: Settings.per_page
    else
      redirect_to root_path
    end
  end

  def create
    respond_to do |format|
      @user = User.find params[:followed_id]
      unless current_user.following?(@user)
        current_user.follow @user
        @relationship = current_user.active_relationships
          .find_by followed_id: @user.id
      end
      format.js
    end
  end

  def destroy
    respond_to do |format|
      relationship = Relationship.find_by(id: params[:id])
      if relationship
        @user = relationship.followed
        current_user.unfollow @user
        @relationship = current_user.active_relationships.build
      end
      format.js
    end
  end
end
