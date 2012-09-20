module ApplicationHelper
  
  def markdown
    Redcarpet::Markdown.new(Redcarpet::Render::HTML,:autolink => true, :space_after_headers => true)
  end
  
  def spannerize(content)
    content.to_s.split("").map{|c| "<span>#{c}</span>" }.join.html_safe
  end
  
  def is_about?
    params[:action] == 'how' || params[:action] == 'who'
  end
  
  def is_community?
    params[:action] == 'community' || params[:controller] == 'partners' || params[:controller] == 'ventures' || params[:controller] == 'members' || params[:controller] == 'friends' || params[:controller] == 'socials' ||  params[:controller] == 'gigs' || params[:action] == "calendar"
  end
  
  def is_challenges?
     params[:controller] == 'challenges'
  end
  
  def is_warblings?
    params[:controller] == 'warblings' || params[:controller] == 'bookmarks' || params[:controller] == 'posts'
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
	
	def contextual_name(user)
	  (user_signed_in? && current_user == user) ? "you've" : "#{user.short_name}'s"
	end
  
end
