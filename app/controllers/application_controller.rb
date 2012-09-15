class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :fetch_chapters
  before_filter :store_location
  helper_method :signed_in_as_owner?

  def signed_in_as_owner?(resource)
    if user_signed_in? && resource == current_user
      true
    elsif resource.class != User && resource.user.present? && user_signed_in?
      if current_user.admin?
        true
      else
        resource.user == current_user
      end
    else
      false
    end
  end

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
    
  def fetch_chapters
    @all_chapters = Chapter.all
  end
  
  private
  
    def store_location
      if !user_signed_in?
        if params[:next]
          session[:return_to] = params[:next]
        else
           session[:return_to] = nil
        end
      end
    end

    def stored_location_for(resource_or_scope)
      session[:return_to] || super
    end
  
    def after_sign_in_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || member_path(resource_or_scope) || signed_in_root_path(resource_or_scope)
    end
  
end