class AddStuffToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :email, :string
    add_column :partners, :notes, :text
  end
end
