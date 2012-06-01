Goodfornothing::Application.routes.draw do
	
  ActiveAdmin.routes(self)
  devise_for :users
  
	namespace :blog do
		resources :posts, :only => [:index, :show]
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
	    match ":region" => "gigs#index", :as => "regional"
	  end
	end
	
	resources :briefs, :only => [:show]

	match "business" => "colophon#business"
	match "about" => "colophon#about"
	match "friends" => "colophon#friends"

	root :to => "blog/posts#index"

end