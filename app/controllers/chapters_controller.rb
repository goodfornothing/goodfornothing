class ChaptersController < ApplicationController

  def show
    
      @chapter = Chapter.find_by_slug(params[:id])
            
      @socials = Social.where('start_time >= ?',Time.now).where('chapter_id = ?',@chapter.id).order("start_time DESC")
      @gigs = Gig.where('start_time >= ?',Time.now).where('chapter_id = ?',@chapter.id).order("start_time DESC")      

      @previous_socials = Social.where('start_time < ?',Time.now).where('chapter_id = ?',@chapter.id).order("start_time DESC")
      @previous_gigs = Gig.where('start_time < ?',Time.now).where('chapter_id = ?',@chapter.id).order("start_time DESC")      
      
      @upcoming_events = (@socials + @gigs).sort_by(&:start_time)
      @previous_events = (@previous_socials + @previous_gigs).sort_by(&:start_time)
    
  end

  def contact
    
  end

	def register
		
	end

end
