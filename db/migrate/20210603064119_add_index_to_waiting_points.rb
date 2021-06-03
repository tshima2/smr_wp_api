class AddIndexToWaitingPoints < ActiveRecord::Migration[5.2]
  def up
    query="CREATE index index_geog ON waiting_points USING gist (geog);"
    ActiveRecord::Base.connection.execute(query)
  end
  def down
    query="DROP index index_geog;"
    ActiveRecord::Base.connection.execute(query)
  end
end
