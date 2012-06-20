Goodfornothing::Application.routes.draw do
	
  ActiveAdmin.routes(self)
  match "/markdown_preview" => "application#markdown_preview"
  devise_for :users, :controllers => { :registrations => "registrations" } 
  
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
	    match "chapter/:chapter" => "gigs#index", :as => "chapter"
	  end
	  member do 
	    get "attend"
	    get "attending"
	  end
	end
	
	resources :briefs, :only => [:show]
  
  resources :partners, :only => [:index]
  resources :friends, :only => [:index]
  resources :ventures, :only => [:index]
  
  match "members" => "members#index"
  match "members/:id" => "members#show", :as => "member"
  
	match "about" => "colophon#about"
	match "how" => "colophon#how"
	match "community" => "colophon#community"

	root :to => "home#index"

end