Goodfornothing::Application.routes.draw do
	
  ActiveAdmin.routes(self)
  
  match "markdown_preview" => "application#markdown_preview"
  
  devise_for :users, :controllers => { :registrations => :registrations }
  
  devise_scope :user do
    get "/login" => "devise/sessions#new"
    delete "/logout" => "devise/sessions#destroy"
    get "/register" => "devise/registrations#new"
  end

  match "warblings" => "colophon#conversation"
  
  namespace :conversation do
    
    resources :posts, :only => [:index, :show] do
		  collection do 
  	    match "category/:id" => "posts#index", :as => "categorised"
  	  end
		end
		
		resources :bookmarks do
	    collection do 
  	    get "index"
  	    get "search"
  	    match "tag/:id" => "bookmarks#index", :as => "tagged"
  	  end
    end
    
  end

  resources :challenges, :only => [:show, :index]

	resources :gigs, :only => [:show, :index] do
	  collection do 
	    match "chapter/:id" => "gigs#index", :as => "chapter"
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
  match "members/:id" => "members#show", :as => "member"
  
  match "how" => "colophon#how"
	match "about" => "colophon#about"
	match "who" => "colophon#who"
	match "community" => "colophon#community"

	root :to => "home#index"

end