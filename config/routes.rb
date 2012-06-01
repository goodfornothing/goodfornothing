Goodfornothing::Application.routes.draw do
	
  ActiveAdmin.routes(self)
  devise_for :users
  
	namespace :blog do
		resources :posts, :only => [:index, :show] do
		  collection do 
  	    match "category/:category" => "posts#index", :as => "categorised"
  	  end
		end
	end
	
	namespace :library do
	  resources :bookmarks do
	    collection do 
  	    get "index"
  	    get "search"
  	  end
    end
	  resources :tags, :only => [:show]
	end

	resources :gigs, :only => [:show, :index] do
	  collection do 
	    match "region/:region" => "gigs#index", :as => "regional"
	  end
	end
	
	resources :briefs, :only => [:show]

  match "members" => "members#index"
  match "members/:id" => "members#show", :as => "member"
  
	match "business" => "colophon#business"
	match "about" => "colophon#about"
	match "friends" => "colophon#friends"

	root :to => "blog/posts#index"

end