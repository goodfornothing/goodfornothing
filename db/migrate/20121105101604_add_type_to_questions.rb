class AddTypeToQuestions < ActiveRecord::Migration
  def change
		add_column :questions, :type, :string
		add_column :questions, :required, :boolean, :default => false
  end
end
