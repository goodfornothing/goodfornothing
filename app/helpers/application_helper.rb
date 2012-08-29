module ApplicationHelper
  
  def markdown
    Redcarpet::Markdown.new(Redcarpet::Render::HTML,:autolink => true, :space_after_headers => true)
  end
  
  def spannerize(content)
    content.to_s.split("").map{|c| "<span>#{c}</span>" }.join.html_safe
  end
  
  def is_about?
    params[:action] == 'about' || params[:action] == 'who' || params[:action] == 'how'
  end
  
  def is_community?
    params[:action] == 'community' || params[:controller] == 'partners' || params[:controller] == 'ventures' || params[:controller] == 'members' || params[:controller] == 'friends'
  end
  
  def is_challenges?
     params[:controller] == 'challenges' ||  params[:controller] == 'gigs'
  end
  
  def is_warblings?
    params[:controller] == 'warblings' || params[:controller] == 'bookmarks'
  end
  
end
