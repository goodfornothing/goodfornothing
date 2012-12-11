class RenameNotesPages < ActiveRecord::Migration
  def up
		rename_table :notes, :pages
  end

  def down
		rename_table :pages, :notes
  end
end
