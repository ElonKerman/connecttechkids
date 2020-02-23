class AddLaunchToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :launch, :string
  end
end
