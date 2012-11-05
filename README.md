Good for Nothing Web Hive
=========================

An embryonic platform to support and amplify the Good for Nothing communities' efforts.

### Mailchimp/Devise integration

User accounts are tied to a Mailchimp subscriber lists. Users can edit their preferences on their profile page. 

Set your API key and list name in `config/mailchimp.yml`

### Uploader storage

By default the application uses carrierwave and S3 for image storage. You'll need to pop your AWS credential in `config/carrierwave.yml`

### Check for life

You can check your `trill` URLs for life by running `rake trills:ping` daily. Every time a bookmark fails to respond it'll be given a strike, two strikes and it'll be automatically unpublished. A strike is deducted for every active response.

### Making something Commentable

Thar includes an ActiveRecord extension to make things commentable upon:

Show the comments form

    <%= 
	    render :partial => "comments/panel", :locals => { 
		    :comments => @modelName.comments, 
		    :commentable => @modelName
	    } 
    %>

Extend your model

    acts_as_commentable

	# Change the labels
	acts_as_commentable :label => "Ideas", :title => "Tell us yer ideas!"
	
Labels can be instance specific, try this in your controller

    model.commentable_title = "Tell us yer ideas!"
	model.commentable_label = "Ideas"

Add some routeage

    resources :model do
	  resources :comments 
	end
	
### Making something Eventable

Extend your model

    acts_as_event

Add some columns to your table

    add_column :model, :title, :string
    add_column :model, :description, :text
    add_column :model, :location, :string
    add_column :model, :slug, :string
    add_column :model, :start_time, :timestamp
    add_column :model, :end_time, :end_time
    add_column :model, :chapter_id, :integer

### Create a custom messaging model

Standard messaging functionality between users exists, you can extend this functionality in order create messages with different attributes. For example, if you wanted to create an Order form:

Create your model in `models/messaging/order.rb`

    class Message::Order < ActiveRecord::Base

	    attr_accessible :contact, :description, :name
						:message_attributes
	
	    has_one :message, :as => :submission
	    accepts_nested_attributes_for :message
	
    end

Create a basic controller in `controllers/messaging/orders_controller.rb`

    class Messaging::Order < ApplicationController

        def new
        end

        def create
        end

	end
	
Smash some views into `views/messaging/orders/`
	
## Datum factories

### Wordpress

You can import posts from standard Wordpress eXtended RSS formatted files to the Posts and Trills models using the following rake task:

    rake migrate:wordpress filename

Images referenced in posts will be downloaded and stored locally, image tags will be updated to reference these local files.

Post and category relationships will be maintained.  

### Bookmarks 

The Netscape Bookmark format, surprisingly, is still rather common (Read it Later, Chrome, Firefox). Use this task to import bookmarks and tags into the Bookmark and Tag models.

    rake migrate:bookmarks filename

Bookmark and tag relationships will be maintained.

### Ning user

Used to import a CSV Ning user list to a NingProfile model and map it to a core Devise User model.

    rake migrate:ning filename

## Installation:

    rake goodfornothing:install

You'll need to ensure sendmail is enabled on your server, for Engine Yard follow these instructions:

https://support.cloud.engineyard.com/entries/21016513-set-up-ssmtp-for-mail-relay-to-authsmtp    

## License

GPL License
Copyright © 2012 Good for Nothing, http://goodfornothing.com

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>