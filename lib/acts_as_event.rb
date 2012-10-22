module Eventable

  def acts_as_event
    
		attr_accessible :title, :description, :location, :slug,
										:slots_attributes, :start_time, :end_time,
										:chapter_id

		scope :past, where("start_time <= ?", Time.now)
	  scope :future, where("start_time >= ?", Time.now)

		just_define_datetime_picker :start_time, :add_to_attr_accessible => true
	  just_define_datetime_picker :end_time, :add_to_attr_accessible => true

		has_many :slots
	  has_many :users, :through => :slots
		belongs_to :chapter
			
		after_create :create_generic_slot
		accepts_nested_attributes_for :slots
		validates_presence_of :start_time, :chapter
		
		extend FriendlyId
	  friendly_id :custom_slug, use: :history
	
    include InstanceMethods

  end

  module InstanceMethods

    def acts_as_event?
      true
    end

		def is_attending?(user)
			self.users.include?(user)
		end

		def create_generic_slot
		  Slot.create!(self.class.to_s.foreign_key => self.id)
	  end

		def custom_slug
			(self.title.present?) ? self.title : self.start_time
		end

		def name
			if self.title.present?
				self.title
			else
				"A #{self.class.to_s.humanize.downcase} in #{self.chapter.title}"
			end
		end
		
		def attendees
			if self.chapter.users.crew.any?
		    (self.chapter.users.crew + self.users).flatten.uniq.reverse
		  else
		    self.users.reverse
		  end
		end
		
		def past?
	    if self.end_time?
	      self.end_time < Time.now
	    else
	      self.start_time < Time.now
	    end
	  end

	  def future?
	    self.start_time > Time.now
	  end

  end

end

ActiveRecord::Base.extend Eventable