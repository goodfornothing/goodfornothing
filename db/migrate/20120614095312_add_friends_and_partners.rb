class AddFriendsAndPartners < ActiveRecord::Migration
  def up
    rename_table :regions, :chapters
    create_table :friends do |t|
      t.string :name
      t.string :url
      t.string :logo
    end
    create_table :partners do |t|
      t.string :name
      t.string :url
      t.string :logo
    end
  end

  def down
    rename_table :chapters, :regions
    drop_table :partners
    drop_table :friends
  end
end
