# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

_names = []
_names << "ミニストップ 前原西４丁目店"
_names << "待機場所_1230@200915"
_names << "セブンイレブン東船橋５丁目店"
_names << "ミニストップ船橋米ヶ崎店"
_names << "待機場所_1230@201005"

_points = []
_points << "POINT(140.0147396 35.6965257)"
_points << "POINT(140.0215715 35.7000189)"
_points << "POINT(140.0041245 35.6910275)"
_points << "POINT(140.0036023 35.7120936)"
_points << "POINT(140.0291712 35.6851166)"

(0..4).each do |index|
  _name=_names[index]; _memo=Faker::JapaneseMedia::DragonBall.character; _geog=_points[index]
  WaitingPoint.create(name: _name, memo: _memo, geog: _geog)
end
