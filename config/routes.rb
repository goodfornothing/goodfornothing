Goodfornothing::Application.routes.draw do
	
  ActiveAdmin.routes(self)

	# Sir Trevor images
  post 'attachments' => 'images#create'
    
  devise_for :users, :controllers => { :registrations => :registrations, :sessions => :sessions } 
  match "members" => "members#index"
	match "members/find/similar" => "members#similar"
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
    get '/users/edit/notifications' => 'registrations#edit_notifications', :as => "notifications"

  end
  
  match 'warblings' => "warblings#index"
  match 'warblings/author/:id' => "warblings#author", :as => "warblings_author"
  match 'warblings/:id' => "warblings#show", :as => "warbling"

  resources :posts, :only => [:show, :index]

	namespace :messaging do
		resources :messages, :only => [:create] do
			collection do
				get 'failure'
				get 'done'
				get 'chapter/:id', :action => "chapter", :as => "message_chapter"
				get 'member/:id', :action => "member", :as => "message_member"
			end
		end
		resources :chapters, :only => [:new, :create] do
			collection do
				get 'done'
			end
		end
		resources :challenges, :only => [:new, :create] do
			collection do
				get 'done'
			end
		end
		resources :partners, :only => [:new, :create] do
			collection do
				get 'done'
			end
		end
	end

  resources :challenges, :only => [:show, :index] do
    collection do
      match "issue/:id" => "challenges#index", :as => "issue"
    end
		member do
			get "subscribe"
		end
    resources :comments
    resources :contributions
  end

	get ":resource/:id/attend" => "events#attend", :as => "attend"

	resources :gigs, :only => [:show, :index] do
	  collection do 
	    match "chapter/:id" => "gigs#index", :as => "chapter"
	  end
	end
  
  resources :chapters
	
	resources :socials, :only => [:show] do
		resources :comments
	end
		
  resources :partners, :only => [:index]
  resources :friends, :only => [:index]
  resources :ventures, :only => [:index]
  
	scope '/wiki' do
		resources :pages, :only => [:show, :index]
	end

  match "how-it-works" => "colophon#how", :as => "how"
	match "how-it-works/funding" => "colophon#funding", :as => "funding"
	match "who" => "colophon#who"
	match "community" => "colophon#community"
  match "calendar" => "colophon#calendar"
  match "privacy" => "colophon#privacy"
  match "datums" => "colophon#datums"
  match "survey" => redirect("https://swarm.typeform.com/to/A3gBQ3?embed=full"), :as => :store    
  match "store" => redirect("http://goodfornothing.ourtshirtshop.co.uk/"), :as => :store  
  
	match 'good-in-your-hood' => "colophon#chapter", :as => "chapter_register"
   
	root :to => "home#index"

end