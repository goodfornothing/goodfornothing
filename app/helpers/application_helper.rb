module ApplicationHelper
  
  def markdown
    Redcarpet::Markdown.new(Redcarpet::Render::HTML,:autolink => true, :space_after_headers => true)
  end
  
  def spannerize(content)
    content.to_s.split("").map{|c| "<span>#{c}</span>" }.join.html_safe
  end
  
end
