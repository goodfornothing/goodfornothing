class AddStuffToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :description, :text
    add_column :skills, :upper, :string
    add_column :skills, :lower, :string
  end
end
