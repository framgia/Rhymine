class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.is_admin?
      can :manage, Genre
      can [:read, :destroy], Song
      can :destroy, User
    else
      can :manage, Song
    end
    can :manage, Comment
    can :create, Like
    can :destroy, Like do |like|
      like.user == user
    end
    can [:read], User
  end
end
