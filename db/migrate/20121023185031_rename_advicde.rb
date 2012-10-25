class RenameAdvicde < ActiveRecord::Migration
  def change
		rename_table :note, :notes
	end
end
