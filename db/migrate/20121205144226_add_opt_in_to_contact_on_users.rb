class AddOptInToContactOnUsers < ActiveRecord::Migration
  def change
		add_column :users, :can_be_contacted, :boolean, :default => true
		User.all.each do |user|
			user.can_be_contacted = false
			user.save
		end
  end
end