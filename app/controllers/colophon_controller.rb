class ColophonController < ApplicationController

	def chapter
		@chapters = Chapter.order("title ASC").all
	end

	def who
		@all_chapters = Chapter.all
	end
	
	def how
	end
	
	def funding
	end

	def highlights
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
	  
	  # Member statistics
	  @members = {}
	  @members['inactive'] = User.where(:activated => false).count
	  @members['active'] = User.active.count
	  
	  completion_percentages = User.active.map(&:profile_completion)
	  @members['completion_average'] = (completion_percentages.inject{ |sum, el| sum + el }.to_f / completion_percentages.size).to_i
	  
	  @members['shared_comments'] = ((User.where('id in (?)', Comment.all.map(&:user_id).join(',')).count.to_f / @members['active'].to_f) * 100).round
	  @members['shared_contributions'] = ((User.where('id in (?)', Contribution.all.map(&:user_id).join(',')).count.to_f / @members['active'].to_f) * 100).round
	  @members['attended_gigs'] = ((Gig.all.map{ |g| g.users.map(&:id) if g.users.any? }.compact.flatten.uniq.count.to_f / @members['active'].to_f) * 100).round
	  @members['attended_socials'] = ((Social.all.map{ |s| s.users.map(&:id) if s.users.any? }.compact.flatten.uniq.count.to_f / @members['active'].to_f) * 100).round
	  
	  @crew = {}
	  @crew['blog_posts'] = Post.all.count
	  @crew['trills'] = Issue.all.map{ |w| w.trills.published }.flatten.uniq.count
	  @crew['challenges'] = Challenge.activated.count
	  @crew['gigs'] = Gig.all.count
	  @crew['socials'] = Social.all.count
	  
	  @users = {}
	  @users['comments'] = Comment.all.count
	  @users['contributions'] = Contribution.all.count
	  @users['gigs_signed_up'] = Slot.where('gig_id IS NOT NULL').map{ |s| s.users.map(&:id) if s.users.any? }.compact.flatten.uniq.count
	  @users['partner_requests'] = Partner.inactive.count
	  @users['challenge_requests'] = Challenge.inactive.count
	  
	  @ga_profile = Garb::Management::Profile.all.detect {|p| p.web_property_id == 'UA-32250261-2'}
    @ga_uniques = @ga_profile.newvisits(:start_date => Date.today - 6.months, :end_date => Date.today).first.new_visits
	  
	  mc = Gibbon.new(ENV['MC_API_KEY'], { :throws_exceptions => false})
    mc.campaigns({:list_id => ENV['MC_LIST_ID'], :status => 'sent'})['total']
	  @mailchimp_newsletters = mc.campaigns({:list_id => ENV['MC_LIST_ID'], :status => 'sent'})['total'];
	  @mailchimp_newsletters = 9
	  
	  #@fb_page = FbGraph::Page.new('g00dfornothing').fetch({:access_token => 'AAAFIALGg4joBACcLZBeYI9ZAD0o0bHE5UPDN5lOEH8hjXHxUnN8ZAZCpYNtZATmp0MlYLzbH94DWfBkUKGrO792ZCUFobdVEZCk27gmWqlpl9fMzFwvViuG'})
	  @fb_page = FbGraph::Page.new('g00dfornothing').fetch()
	  @fb_likes = @fb_page.raw_attributes['likes'];
	  @fb_posts = 25
	  #@fb_posts = @fb_page.posts.size
	  
	  @twitter_followers = 2904 #Twitter.user("g00dfornothing").followers_count;
	  @twitter_tweets = 2530 # Twitter.user("g00dfornothing").statuses_count;
	    
	end

	def watch
		@watches = Post.where(:watch => 1)
	end

end