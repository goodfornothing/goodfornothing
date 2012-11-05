class SodIt < ActiveRecord::Migration
  def up
		drop_table :questions
		drop_table :forms
		drop_table :answers
		remove_column :messages, :form_id
		add_column :messages, :submission_id, :integer
		add_column :messages, :submission_type, :string
  end
end
