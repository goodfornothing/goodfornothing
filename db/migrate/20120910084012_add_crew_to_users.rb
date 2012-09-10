class AddCrewToUsers < ActiveRecord::Migration
  def change
    add_column :users, :crew, :boolean, :default => false
  end
end
