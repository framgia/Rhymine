class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.is_admin?
      can :manage, Genre
      can [:read, :destroy], Song
      can :destroy, User
    else
      can [:new, :create, :read], Song
      can [:edit, :update, :destroy], Song do |song|
        song.user == user
      end
    end
    can :manage, Comment
    can :create, Like
    can :destroy, Like do |like|
      like.user == user
    end
    can [:read], User
    can [:create], Report
  end
end
