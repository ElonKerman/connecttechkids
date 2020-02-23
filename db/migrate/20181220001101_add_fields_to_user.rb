class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :admin, :boolean, :default => false
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
  end
end
