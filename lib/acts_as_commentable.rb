module ActsAsCommentable
		
  def acts_as_commentable(options = {})
	
		_label = (options[:label]) ? options[:label] : "Comment"
	 	_title = (options[:title]) ? options[:title] : "Post a comment"
		
    class_eval do

			has_many :comments, :as => :commentable

			def open_for_comment?
				(self.respond_to?('open')) ? self.open : true
			end

			private
			
				define_method :commentable_label do
					_label
				end

				define_method :commentable_title do
					_title
				end
		
		end
		
	end
	
end
