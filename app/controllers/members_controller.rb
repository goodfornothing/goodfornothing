class MembersController < ApplicationController

	def similar
		
		@similar = User.where('(avatar is not null && avatar != "")')
		@similar += User.includes(:issues).where("issues.id in (?)", params[:issues].map { |s| s.to_i }) if params[:issues]
		@similar += User.where("chapter_id = ?",params[:chapter].to_i) if params[:chapter]
		@similar += User.where("location like ?", "%#{params[:location]}%") if params[:location]
		
		@similar = @similar.group_by {|x| x}.sort_by {|x,list| [-list.size,x]}.map(&:first).take(12)
			
    render :similar
		
	end

	def index
	  
	  @chapter_members = []
	  
	  if user_signed_in?
	   
	    if current_user.chapter.present?
	      @chapter_members = current_user.chapter.users.active
	      @members = User.active.where('chapter_id != ? or chapter_id IS NULL', current_user.chapter.id)
	    else
	      @members = User.active
	    end
	    
  	  @member_reach = current_user.member_reach
	  else
	    @members = User.active
	    @member_reach = []
	  end
	  
  end
  
  def show
    
    @member = User.active.find(params[:id])
    
    if @member.nil?
      not_found
    else
	
      @first_sign_in = (user_signed_in? && params[:welcome].present? && current_user == @member) ? true : false
			@completion = @member.profile_completion
			
      @gig = (params[:gig_id].present?) ? Gig.find(params[:gig_id]) : nil
			@social = (params[:social_id].present?) ? Social.find(params[:social_id]) : nil
      
			@history = (@member.comments + @member.contributions + @member.trills.published + @member.socials + @member.gigs).sort_by(&:audited_at).reverse.group_by{ |t| [t.audited_at.year,t.audited_at.month] }  

    end
		
  end

end
