Goodfornothing::Application.routes.draw do
	
  ActiveAdmin.routes(self)
  devise_for :users
  
	namespace :blog do
		resources :posts, :only => [:index, :show]
	end

	resources :events, :only => [:index, :show]

	match "business" => "colophon#business"
	match "about" => "colophon#about"
	match "friends" => "colophon#friends"

	root :to => "blog/posts#index"

end