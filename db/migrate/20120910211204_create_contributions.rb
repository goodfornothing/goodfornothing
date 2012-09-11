class CreateContributions < ActiveRecord::Migration
  def up
    create_table :contributions do |t|
      t.string :title
      t.string :url
      t.text :description
      t.boolean :accepted, :default => false
      t.references :user
      t.references :challenge
      t.timestamps
    end
  end

  def down
    drop_table :contributions
  end
end
