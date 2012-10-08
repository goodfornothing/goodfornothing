class GigsController < ApplicationController

  respond_to :html
  
  before_filter :fetch_gig, :only => [:show, :attend, :attending]
  before_filter :authenticate_user!, :only => [:attend]

	def index
	  @chapter = Chapter.find(params[:id]) if params[:id]
	  @past_gigs = (@chapter) ? Gig.where('start_time < ? and chapter_id = ?', Date.today, @chapter.id).order('start_time DESC') : Gig.where('start_time < ?', Date.today).order('start_time DESC')
	end

	def show
	  
	  # FriendlyID History
    if request.path != gig_path(@gig)
      return redirect_to @gig, :status => :moved_permanently
    end
	  
	  if @gig.chapter.users.crew.any?
	    @attendees = @gig.users.where("users.id NOT IN (#{@gig.chapter.users.crew.map(&:id).join(',')})")
	  else
	    @attendees = @gig.users
	  end
	end
	
	def attend

    location = gig_path(@gig)

	  if @gig.users.include?(current_user)
	    slot = current_user.slots.select { |item| item.gig_id == @gig.id }.first	    
      slot.users.delete(current_user)
      flash[:notice] = "You are no longer attending this gig."
    else
      slot = (params[:slot].nil?) ? @gig.slots.first : Slot.find(params[:slot])
      if slot.limit && (slot.users.count >= slot.limit &&  slot.limit > 0)
        flash[:error] = "Sorry, we've reached the limit for this slot."
      else
        slot.users << current_user
        path = URI.parse(request.referer).path
        if path == "/register" || path == "/users"
          location = member_path(current_user, :welcome=>"yahuh", :gig => @gig.id)
        else 
          location = gig_path(@gig)
        end
      end
    end
  
    redirect_to location
    
	end
	
	private
	  
	  def fetch_gig
	    @gig = Gig.find(params[:id])
	    if @gig.nil?
	      not_found
	    end
	  end

end
