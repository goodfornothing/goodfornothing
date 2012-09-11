Goodfornothing::Application.routes.draw do
	
  ActiveAdmin.routes(self)
  
  match "markdown_preview" => "application#markdown_preview"
  
  devise_for :users, :controllers => { :registrations => :registrations } 
  
  devise_scope :user do
    get "/login" => "devise/sessions#new"
    delete "/logout" => "devise/sessions#destroy"
    get "/register" => "registrations#new"
    get "/claim/:id/:secret" => "registrations#claim", :as => "claim"
    get '/users/activity' => 'registrations#activity'
  end
  
  
  resources :warblings, :only => [:index,:show]
  resources :posts, :only => [:show]

  match "library" => "bookmarks#index"
  match "library/search" => "bookmarks#search"
  match "library/:id" => "bookmarks#index", :as => "bookmark_tag"

  resources :challenges, :only => [:show, :index, :new, :create] do
    collection do
      match "warbling/:id" => "challenges#index", :as => "warbling"
      match "thanks" => "challenges#thanks", :as => "thanks"
    end
    resources :ideas
    resources :contributions
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
	
  resources :partners, :only => [:index,:new, :create] do
    collection do
      match "thanks" => "partners#thanks", :as => "thanks"
    end
  end
  
  resources :friends, :only => [:index]
  resources :ventures, :only => [:index]
  
  match "members" => "members#index"
  match "members/:id" => "members#show", :as => "member"
  
  match "how-it-works" => "colophon#how", :as => "how"
	match "who" => "colophon#who"
	match "community" => "colophon#community"
  match "calendar" => "colophon#calendar"
  match "privacy" => "colophon#privacy"

	root :to => "home#index"

end