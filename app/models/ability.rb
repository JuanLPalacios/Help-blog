class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.is? :admin
      can :delete, Post
      can :delete, Comment
    else
      can :delete, Post, author: user
      can :delete, Comment, author: user
    end
  end
  end
end
