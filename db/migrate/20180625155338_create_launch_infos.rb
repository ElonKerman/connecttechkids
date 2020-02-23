class CreateLaunchInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :launch_infos do |t|
      t.string :location
      t.datetime :date_time
      t.string :company
      t.string :reflight
      t.string :landing
      t.string :destination
      t.string :vehicle
      t.string :payload
      t.string :orbit
      t.text :description

      t.timestamps
    end
  end
end
