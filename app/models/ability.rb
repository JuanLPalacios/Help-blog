class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.is? :admin
      can :destroy, Post
      can :destroy, Comment
    else
      can :destroy, Post, author: user
      can :destroy, Comment, author: user
    end
  end
  end
end
