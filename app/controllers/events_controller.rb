class EventsController < ApplicationController

  before_filter :authenticate_user!, :only => [:attend]
	
	def attend

		klass = params[:resource].classify.constantize
		resource = klass.find(params[:id])
		
		if resource.nil?
			not_found
		end
		
    location = url_for([resource])

	  if resource.users.include?(current_user)
	  	slot = current_user.slots.where(klass.to_s.foreign_key => resource.id).first	    
    	slot.users.delete(current_user)
      flash[:notice] = "You are no longer attending this #{klass.to_s}."
    else
      slot = (params[:slot].nil?) ? resource.slots.first : Slot.find(params[:slot])
      if slot.limit && (slot.users.count >= slot.limit &&  slot.limit > 0)
        flash[:error] = "Sorry, we've reached the limit for this slot."
      else
        slot.users << current_user
        path = URI.parse(request.referer).path
        if path == "/register" || path == "/users"
          location = member_path(current_user, :welcome=>"yahuh", :gig => resource.id)
        else 
          location = url_for([resource])
        end
      end
    end
  
    redirect_to location
    
	end

end
