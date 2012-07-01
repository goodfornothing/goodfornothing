Goodfornothing::Application.routes.draw do
	
  ActiveAdmin.routes(self)
  
  match "markdown_preview" => "application#markdown_preview"
  devise_for :users, :controllers => { :registrations => "registrations" } 

  match "conversation" => "colophon#conversation"
  namespace :conversation do
    resources :posts, :only => [:index, :show] do
		  collection do 
  	    match "category/:category" => "posts#index", :as => "categorised"
  	  end
		end
		resources :bookmarks do
	    collection do 
  	    get "index"
  	    get "search"
  	    match "tag/:tag" => "bookmarks#index", :as => "tagged"
  	  end
    end
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
	
  resources :partners, :only => [:index]
  resources :friends, :only => [:index]
  resources :ventures, :only => [:index]
  
  match "members" => "members#index"
  match "members/:slug" => "members#show", :as => "member"
  
  match "do" => "colophon#do"
	match "about" => "colophon#about"
	match "how" => "colophon#how"
	match "community" => "colophon#community"

	root :to => "home#index"

end