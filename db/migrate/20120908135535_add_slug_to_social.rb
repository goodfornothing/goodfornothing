class AddSlugToSocial < ActiveRecord::Migration
  def change
    add_column :socials, :slug, :string
  end
end
