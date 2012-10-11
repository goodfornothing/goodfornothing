Goodfornothing::Application.routes.draw do
	
  ActiveAdmin.routes(self)

	# Sir Trevor images
  post 'attachments' => 'images#create'
    
  devise_for :users, :controllers => { :registrations => :registrations, :sessions => :sessions } 
  match "members" => "members#index"
  match "members/:id" => "members#show", :as => "member"

  devise_scope :user do
    
    # Rename default devise scopes
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
    get "/register" => "registrations#new"
    
    # Ning user activation routes
    get "/reactivate" => "registrations#reactivate", :as => "reactivate"
    post "/reactivate" => "registrations#send_reactivation", :as => "reactivate"
    get "/claim/:reset_password_token" => "registrations#claim", :as => "claim"
    put "/claim/" => "registrations#activate", :as => "activate"
    
    # Profile editing
    get '/users/edit/activity' => 'registrations#edit_activity', :as => "activity"
    get '/users/edit/talents' => 'registrations#edit_talents', :as => "talents"
    get '/users/tell-us-more' => 'registrations#edit_moar', :as => "moar"
    
    put '/users/edit/activity' => 'registrations#update_activity', :as => "activity"
    put '/users/edit/talents' => 'registrations#update_talents', :as => "talents"
    
  end
  
  match 'warblings' => "warblings#index"
  match 'warblings/:id' => "warblings#show", :as => "warbling"
  
  resources :posts, :only => [:show, :index]

  resources :challenges, :only => [:show, :index, :new, :create] do
    collection do
      match "issue/:id" => "challenges#index", :as => "issue"
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
  
  match "how-it-works" => "colophon#how", :as => "how"
	match "who" => "colophon#who"
	match "community" => "colophon#community"
  match "calendar" => "colophon#calendar"
  match "privacy" => "colophon#privacy"
  match "datums" => "colophon#datums"
  
	root :to => "home#index"

end