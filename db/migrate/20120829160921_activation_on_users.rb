class ActivationOnUsers < ActiveRecord::Migration
  def up
    add_column :users, :activated, :boolean, :default => false
  end
end
