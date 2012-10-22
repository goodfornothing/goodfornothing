class Social < ActiveRecord::Base

	acts_as_event
  acts_as_commentable :title => "What's your Better Problem?", :label => "Problem"

	scope :feature, where('featured = true')

  attr_accessible :open, :featured
	before_save :assert_featured
  	
	def assert_featured
    if self.featured?
      Social.where('id != ?',self.id).each do |social|
        social.featured = false
        social.save!
      end
    end
  end

end