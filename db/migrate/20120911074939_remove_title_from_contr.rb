class RemoveTitleFromContr < ActiveRecord::Migration
  def up
    remove_column :contributions, :title
  end

  def down
    add_column :contributions, :title, :string
  end
end
