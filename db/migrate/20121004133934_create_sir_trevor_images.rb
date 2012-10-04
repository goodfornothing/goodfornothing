class CreateSirTrevorImages < ActiveRecord::Migration
  def up
    create_table :sir_trevor_images do |t|
      t.string :file
      t.timestamps
    end
  end

  def down
    drop_table :sir_trevor_images
  end
end
