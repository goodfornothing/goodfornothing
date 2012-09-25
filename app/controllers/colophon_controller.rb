class ColophonController < ApplicationController

	def who
	end
	
	def how
	end

	def community
	  
	  @social = Social.where('start_time > ?',Time.now).first
	  @gig = Gig.where('end_time > ?',Time.now).order("start_time DESC").first
	
	end
	
	def calendar
	  
	  @socials = Social.where('start_time > ?',Time.now).order("start_time DESC")
  	@gigs = Gig.where('end_time > ?',Time.now).order("start_time DESC")
	  
	  @events = (@socials + @gigs).sort_by(&:start_time)
	  
	end
	
	def datums
	  
	  #
	  ##
	  ## CACHE THIS CONTROLLER
	  ##
	  #
	  
	  # Member statistics
	  @members = {}
	  @members['inactive'] = User.where(:activated => false).count
	  @members['active'] = User.active.count
	  
	  completion_percentages = User.active.map(&:profile_completion)
	  @members['completion_average'] = (completion_percentages.inject{ |sum, el| sum + el }.to_f / completion_percentages.size).to_i
	  
	  @members['shared_ideas'] = ((User.where('id in (?)', Idea.all.map(&:user_id).join(',')).count.to_f / @members['active'].to_f) * 100).round
	  @members['shared_contributions'] = ((User.where('id in (?)', Contribution.all.map(&:user_id).join(',')).count.to_f / @members['active'].to_f) * 100).round
	  @members['attended_gigs'] = ((Gig.all.map{ |g| g.users.map(&:id) if g.users.any? }.compact.flatten.uniq.count.to_f / @members['active'].to_f) * 100).round
	  @members['attended_socials'] = ((Social.all.map{ |s| s.users.map(&:id) if s.users.any? }.compact.flatten.uniq.count.to_f / @members['active'].to_f) * 100).round
	  
	  @fb_likes = 0;
	  @fb_posts = 0;
	  
	  @twitter_followers = 0;
	  @twitter_tweets = 0;
	  
	  mc = Gibbon.new()
    mc.campaigns({:list_id => ENV['MC_LIST_ID'], :status => 'sent'})['total']
	  @mailchimp_newsletters = mc.campaigns({:list_id => ENV['MC_LIST_ID'], :status => 'sent'})['total'];
	  
	end

end