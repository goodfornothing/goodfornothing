class AddWhatYouCanDoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :brings, :text
  end
end
