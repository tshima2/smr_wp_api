class WaitingPoint < ApplicationRecord
  validates :tid, presence: true, uniqueness: { scope: [:name] }
  validates :name, presence: true, length: { maximum: 256 }
  validates :memo, length: { maximum: 1024 }
  validates :geog, presence: true, uniqueness: true
  #validates :geom, presence: true, uniqueness: true

=begin  
  def self.retrieve_by_specified_dist(_dist, _lat, _lon)
    query = "SELECT id, name, "
    query += "ST_X(ST_AsText(geom)) AS lat, "
    query += "ST_Y(ST_AsText(geom)) AS lon "
    query += "FROM waiting_points "
    query += "WHERE ST_DWithin(ST_GeomFromEWKT('SRID=3857;POINT(? ?)'), geom, ?) "
    query += "ORDER BY created_at DESC"
    self.find_by_sql([query, _lon, _lat, _dist])
  end
=end

  def self.retrieve_by_specified_dist(_tid, _dist, _lat, _lon)
    query = "SELECT id, name, "
    query += "ST_X(ST_AsText(geog)) AS lat, "
    query += "ST_Y(ST_AsText(geog)) AS lon "
    query += "FROM waiting_points "
    query += "WHERE tid=? AND ST_DWithin(ST_geographyFromText('POINT(? ?)'), geog, ?) "
    query += "ORDER BY created_at DESC"
    self.find_by_sql([query, _tid, _lon.to_f, _lat.to_f, _dist.to_f])
  end

end
