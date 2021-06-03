# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

_tid = 2;

_names = []
_names << "ミニストップ 前原西４丁目店"
_names << "待機場所_1230@200915"
_names << "セブンイレブン東船橋５丁目店"
_names << "ミニストップ船橋米ヶ崎店"
_names << "待機場所_1230@201005"

_points = []
_points << "POINT(140.0169629155669 35.69656370985369)"
_points << "POINT(140.02081975425236 35.70005667548823)"
_points << "POINT(140.0052829693666 35.69101049118176)"
_points << "POINT(140.00796750072277 35.715411065851846)"
_points << "POINT(140.02840382133857 35.68562354012138)"

(0..4).each do |index|
  _name =_names[index]; _memo=Faker::JapaneseMedia::DragonBall.character
  _geog = _points[index]
  WaitingPoint.create(tid: _tid, name: _name, memo: _memo, geog: _geog)
end

=begin (geometry)
_points = []
_points << "POINT(140.0169629155669 35.69656370985369)"
_points << "POINT(140.02081975425236 35.70005667548823)"
_points << "POINT(140.0052829693666 35.69101049118176)"
_points << "POINT(140.00796750072277 35.715411065851846)"
_points << "POINT(140.02840382133857 35.68562354012138)"

(0..4).each do |index|
  _name =_names[index]; _memo=Faker::JapaneseMedia::DragonBall.character
  _geom = _points[index]
  WaitingPoint.create(name: _name, memo: _memo, geom: _geom)
  #WaitingPoint.create(name: _name, memo: _memo, geog: _geog)
end

WaitingPoint.execute("SELECT UpdateGeometrySRID('waiting_points','geom', 3857)");
=end 
