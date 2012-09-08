Goodfornothing::Application.routes.draw do
	
  ActiveAdmin.routes(self)
  
  match "markdown_preview" => "application#markdown_preview"
  
  devise_for :users, :controllers => { :registrations => :registrations }
  
  devise_scope :user do
    get "/login" => "devise/sessions#new"
    delete "/logout" => "devise/sessions#destroy"
    get "/register" => "devise/registrations#new"
    get "/claim/:id/:secret" => "registrations#claim", :as => "claim"
  end
  
  resources :warblings, :only => [:index,:show]
  resources :posts, :only => [:show]

  match "library" => "bookmarks#index"
  match "library/search" => "bookmarks#search"

  resources :challenges, :only => [:show, :index, :new] do
    collection do
      match "warbling/:id" => "challenges#index", :as => "warbling"
    end
  end

	resources :gigs, :only => [:show, :index] do
	  collection do 
	    match "chapter/:id" => "gigs#index", :as => "chapter"
	  end
	  member do 
	    get "attend"
	  end
	end
	
	resources :socials, :only => [:show] do
	  member do 
	    get "attend"
	  end
	end
	
  resources :partners, :only => [:index,:new]
  resources :friends, :only => [:index]
  resources :ventures, :only => [:index]
  
  match "members" => "members#index"
  match "members/:id" => "members#show", :as => "member"
  
  match "how-it-works" => "colophon#how", :as => "how"
	match "who" => "colophon#who"
	match "community" => "colophon#community"
  match "calendar" => "colophon#calendar"

	root :to => "home#index"

end