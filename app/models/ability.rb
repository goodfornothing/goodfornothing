class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new     
  
    alias_action :read, :update, :destroy, :to => :manage_chapter
              
    if user.role == "warbler"
      can :manage, [Trill, Post], :user_id => user.id
    end
    
    if user.role == "cause"
      can :manage, Challenge
    end
    
    if user.role == "leader"
      can :manage, [Friend, Venture, Messaging::Message]
      can :manage, [Gig, Social], :chapter_id => user.chapter.id
      can :manage, [Trill, Post]
			can :read, [Page]
      cannot :delete, Chapter      
      can :manage_chapter, Chapter, :id => user.chapter.id
    end
    
    # ugly feature flags to enable wishlits for specific chapters
    if user.chapter
      if ["Chester", "Camden", "Brighton", "Cardiff"].include?(user.chapter.title)    
        can :manage, [Item]
      end
    end


    if user.role == "admin"
      can :manage, :all
    end
      
  end
end
