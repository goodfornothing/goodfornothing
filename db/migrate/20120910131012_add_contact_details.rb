class AddContactDetails < ActiveRecord::Migration
  def up
    add_column :partners, :contact, :string
    add_column :challenges, :contact, :string
  end

  def down
    drop_column :partners, :contact
    drop_column :challenges, :contact
  end
end
