class Items < ActiveRecord::Migration
  def up
    create_table :items do |t|
      t.references :gig      
      t.string :name
      t.text  :description
      t.string :provided_by 
      t.decimal :payment_value, :precision => 8, :scale => 2
      t.boolean :complete
      t.timestamps
    end
  end

  def down
    drop_table :items
  end
end
