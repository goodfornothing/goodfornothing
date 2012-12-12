class AddMetaToPages < ActiveRecord::Migration
  def change
		add_column :pages, :featured, :boolean, :default => false
		add_column :pages, :description, :string
  end
end
