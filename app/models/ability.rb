class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new       
      
    if user.role == "warbler"
      can :manage, [Trill, Post], :user_id => user.id
    end
    
    if user.role == "cause"
      can :manage, Challenge
    end
    
    if user.role == "leader"
      can :manage, [Friend, Venture]
      can :manage, [Gig, Social], :chapter_id => user.chapter.id
      can :manage, [Trill, Post], :user_id => user.id
    end
    
    if user.role == "admin"
      can :manage, :all
    end
      
  end
end
