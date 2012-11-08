class RemoveDeadColumnsFromMessaging < ActiveRecord::Migration
  def up
		remove_column :messaging_challenges, :contact
		remove_column :messaging_challenges, :name
		remove_column :messaging_partners, :contact
		remove_column :messaging_partners, :name
  end

  def down
		add_column :messaging_challenges, :contact, :string
		add_column :messaging_challenges, :name, :string
		add_column :messaging_partners, :contact, :string
		add_column :messaging_partners, :name, :string
  end
end
