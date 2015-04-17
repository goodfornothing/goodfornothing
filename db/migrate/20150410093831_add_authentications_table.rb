class AddAuthenticationsTable < ActiveRecord::Migration
  def up
    create_table :authentications, :force => true do |t|
      t.string "user_id"
      t.string "provider"
      t.string "uid"
      t.string "token"
      t.string "token_secret"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
    end
  end

  def down
    drop_table :authentications
  end
end