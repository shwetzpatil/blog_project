class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, :all  # permissions for every user, even if not logged in    
    if user.id?  # additional permissions for logged in users (they can manage their posts)
      cannot :update, Article
      if user.admin?  # additional permissions for administrators
        can :manage, :all
      end
      if user.author?
        can :create, [Article, Comment]
        can [:update, :destroy], [Article, Comment], user_id: user.id
      end
    end
  end
end
