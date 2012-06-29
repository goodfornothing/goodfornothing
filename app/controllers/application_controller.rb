class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :fetch_crew

  def authenticate_admin_user!
  	redirect_to new_user_session_path and return if user_signed_in? && !current_user.admin? 
    authenticate_user!
  end

  def current_admin_user
    return nil if user_signed_in? && !current_user.admin? 
    current_user 
  end
  
  def markdown_preview
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    render :inline => markdown.render(params[:data]).html_safe
  end
  
  def not_found
    respond_to do |format|
      format.html { render 'errors/404', :status => 404 }
      format.any { render 'errors/404', :status => 404, :formats => [:html], :layout => 'application', :content_type => Mime[:html] }
    end
  end
  
  def fetch_crew
    @crew = User.where('chapter_id IS NOT NULL').all
  end

end