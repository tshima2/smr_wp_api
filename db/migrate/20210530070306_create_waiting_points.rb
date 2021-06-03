class CreateWaitingPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :waiting_points do |t|
      t.integer :tid
      t.string :name
      t.string :memo
      t.st_point :geog, geographic: true
      #t.st_point :geom, geographic: false
      t.timestamps
    end

    add_index :waiting_points, [:tid, :name], unique: true
  end
end
