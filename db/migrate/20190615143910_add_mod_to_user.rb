class AddModToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :mod, :boolean, default: false
  end
end
