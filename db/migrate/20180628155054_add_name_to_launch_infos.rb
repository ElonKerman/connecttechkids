class AddNameToLaunchInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :launch_infos, :name, :string
  end
end
