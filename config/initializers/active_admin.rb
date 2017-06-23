ActiveAdmin.setup do |config|

  # == Site Title
  #
  # Set the title that is displayed on the main layout
  # for each of the active admin pages.
  #
  config.site_title = "Good for Nothing"

  # Set the link url for the title. For example, to take
  # users to your main site. Defaults to no link.
  #
  config.site_title_link = "/nest"

  # Set an optional image to be displayed for the header
  # instead of a string (overrides :site_title)
  #
  # Note: Recommended image height is 21px to properly fit in the header
  #
  # config.site_title_image = "/images/logo.png"

  # == Default Namespace
  #
  # Set the default namespace each administration resource
  # will be added to.
  #
  # eg:
  #   config.default_namespace = :hello_world
  #
  # This will create resources in the HelloWorld module and
  # will namespace routes to /hello_world/*
  #
  # To set no namespace by default, use:
  #   config.default_namespace = false
  #
  # Default:
  config.default_namespace = :nest
  
  #
  # You can customize the settings for each namespace by using
  # a namespace block. For example, to change the site title
  # within a namespace:
  #
  #   config.namespace :admin do |admin|
  #     admin.site_title = "Custom Admin Title"
  #   end
  #
  # This will ONLY change the title for the admin section. Other
  # namespaces will continue to use the main "site_title" configuration.

  # == User Authentication
  #
  # Active Admin will automatically call an authentication
  # method in a before filter of all controller actions to
  # ensure that there is a currently logged in admin user.
  #
  # This setting changes the method which Active Admin calls
  # within the controller.
  config.authentication_method = :authenticate_admin_user!


  # == Current User
  #
  # Active Admin will associate actions with the current
  # user performing them.
  #
  # This setting changes the method which Active Admin calls
  # to return the currently logged in user.
  config.current_user_method = :current_admin_user


  # == Logging Out
  #
  # Active Admin displays a logout link on each screen. These
  # settings configure the location and method used for the link.
  #
  # This setting changes the path where the link points to. If it's
  # a string, the strings is used as the path. If it's a Symbol, we
  # will call the method to return the path.
  #
  # Default:
  config.logout_link_path = :logout_path

  # This setting changes the http method used when rendering the
  # link. For example :get, :delete, :put, etc..
  #
  # Default:
  config.logout_link_method = :delete

  # == Root
  #
  # Set the action to call for the root path. You can set different
  # roots for each namespace.
  #
  # Default:
  # config.root_to = 'dashboard#index'

  # == Admin Comments
  #
  # Admin comments allow you to add comments to any model for admin use.
  # Admin comments are enabled by default.
  #
  # Default:
  config.allow_comments = false
  #
  # You can turn them on and off for any given namespace by using a
  # namespace config block.
  #
  # Eg:
  #   config.namespace :without_comments do |without_comments|
  #     without_comments.allow_comments = false
  #   end


  # == Batch Actions
  #
  # Enable and disable Batch Actions
  #
  #config.batch_actions = true
  

  # == Controller Filters
  #
  # You can add before, after and around filters to all of your
  # Active Admin resources and pages from here.
  #
  # config.before_filter :do_something_awesome


  # == Register Stylesheets & Javascripts
  #
  # We recommend using the built in Active Admin layout and loading
  # up your own stylesheets / javascripts to customize the look
  # and feel.
  #
  # To load a stylesheet:
  #   config.register_stylesheet 'my_stylesheet.css'
  
  # You can provide an options hash for more control, which is passed along to stylesheet_link_tag():
  #   config.register_stylesheet 'my_print_stylesheet.css', :media => :print
  #
  # To load a javascript file:
  config.register_javascript 'analytics.js'


  # == CSV options
  #
  # Set the CSV builder separator (default is ",")
  # config.csv_column_separator = ','
end

# Hack to allow for sorting by parent item
class ::ActiveAdmin::Views::TabbedNavigation
  def priority_for(item)
    child_item = item.children.detect { |child| display_item?(child) }
    child_item ? child_item.priority : item.priority
  end
  private :priority_for

  # Returns an Array of items to display
  def displayable_items(items)
    items.select do |item|
      display_item? item
    end.sort { |i1, i2| priority_for(i1) <=> priority_for(i2) }
  end
end

# Hack to show pretty boolean values
module ActiveAdmin
  module Views
    class TableFor
      def yesno_column(attribute)
        column(attribute){ |model| model[attribute] ? 'Yes' : 'No' }
      end
      def ticked_column(attribute)
        column(attribute){ |model| model[attribute] ? '&#x2714;'.html_safe : '&#x2717;'.html_safe }
      end      
    end
    class AttributesTable
      def yesno_row(attribute)
        row(attribute){ |model| model[attribute] ? 'Yes' : 'No' }
      end
      def ticked_row(attribute)
        row(attribute){ |model| model[attribute] ? '&#x2714;'.html_safe : '&#x2717;'.html_safe }
      end      
    end
  end
end
