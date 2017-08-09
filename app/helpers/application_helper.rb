module ApplicationHelper
  
  def spannerize(content)
    content.to_s.split("").map{|c| "<span>#{c}</span>" }.join.html_safe
  end
  
  def is_chapters?
    params[:action] == 'chapters'
  end
  
  def is_calendar?
    params[:action] == 'calendar'
  end
  
  def is_about?
    params[:action] == 'how' || params[:action] == 'who' || params[:action] == 'funding'
  end

  def is_highlights?
    params[:action] == 'highlights'
  end
  
  def is_community?
    params[:action] == 'community' || params[:controller] == 'partners' || params[:controller] == 'ventures' || params[:controller] == 'members' || params[:controller] == 'friends' || params[:controller] == 'socials' ||  params[:controller] == 'gigs' || params[:action] == "calendar"
  end
  
  def is_challenges?
     params[:controller] == 'challenges'
  end
  
  def is_warblings?
    params[:controller] == 'warblings' || params[:controller] == 'trills' || params[:controller] == 'posts'
  end

  def is_register?
    params[:controller] == 'registrations'
  end

  def is_watch?
    params[:action] == 'watch'
  end
  
  def contextual_reference(user,term)
    if (user_signed_in? && current_user == user)
      term
    else 
      case term
        when "you"
          user.short_name
  	    when "your" 
  	      "#{user.short_name}'s"
  	    when "you've" 
  	      "#{user.short_name} has"
  	    when "you're"
  	      "#{user.short_name} is"
  	  end
  	end
	end
  
end
