class NewImageFields < ActiveRecord::Migration
  def up
    add_column :gigs, :poster, :string
    add_column :gigs, :logo, :string
    add_column :users, :avatar, :string
    create_table :ventures do |t|
      t.string :logo
      t.string :name
      t.string :url
    end
    add_column :briefs, :venture_id, :integer
  end

  def down
    remove_column :gigs, :poster
    remove_column :gigs, :logo
    remove_column :users, :avatar
    remove_column :briefs, :venture_id
    drop_table :ventures
  end
end
