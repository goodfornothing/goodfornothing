class RenameAdvice < ActiveRecord::Migration
  def change
		rename_table :advice, :note
  end
end
