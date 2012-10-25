module ActsAsCommentable
		
  def acts_as_commentable(options = {})
	
		_label = (options[:label]) ? options[:label] : "Comment"
	 	_title = (options[:title]) ? options[:title] : "Post a comment"
		
    class_eval do

			has_many :comments, :as => :commentable

			def open_for_comment?
				(self.respond_to?('open')) ? self.open : true
			end

			attr_writer :commentable_label
			attr_writer :commentable_title
			
			define_method :commentable_label do
				@commentable_label || _label
			end
			
			define_method :commentable_title do
				@commentable_title || _title
			end
		
		end
		
	end
	
end

ActiveRecord::Base.extend ActsAsCommentable