class DropOldMessagingFields < ActiveRecord::Migration
  def change
	
		remove_column :partners, :contact
		remove_column :partners, :notes
		remove_column :partners, :purpose
		remove_column :partners, :email
		
		remove_column :challenges, :contact
		
  end
end
