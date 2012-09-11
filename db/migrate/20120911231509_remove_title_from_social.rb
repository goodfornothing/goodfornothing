class RemoveTitleFromSocial < ActiveRecord::Migration
  def up
    remove_column :socials, :title
  end

  def down
    add_column :socials, :title, :string
  end
end
