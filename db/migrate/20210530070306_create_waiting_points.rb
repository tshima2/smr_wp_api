class CreateWaitingPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :waiting_points do |t|
      t.string :name
      t.string :memo
      t.st_point :geog, geographic: true
      t.timestamps
    end
  end
end