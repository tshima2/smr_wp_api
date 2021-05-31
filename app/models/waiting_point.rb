class WaitingPoint < ApplicationRecord
  validates :name, presence: true, length: { maximum: 256 }
  validates :memo, length: { maximum: 1024 }
  validates :geog, presence: true, uniqueness: true

  def self.retrieve_by_specified_dist(_dist, _lat, _lon)
    query = "SELECT id, name, ST_X(ST_AsText(geog)) AS lat, ST_Y(ST_AsText(geog)) AS lon "
    query += "FROM waiting_points "
    query += "WHERE ST_DWithin(ST_GeographyFromText('POINT(? ?)'), geog, ?) "
    query += "ORDER BY created_at DESC"
    self.find_by_sql([query, _lon.to_f, _lat.to_f, _dist.to_f])
  end
end
