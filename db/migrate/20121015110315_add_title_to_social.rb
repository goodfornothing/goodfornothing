class AddTitleToSocial < ActiveRecord::Migration
  def change
		add_column :socials, :title, :string
  end
end
