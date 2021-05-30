class WaitingPoint < ApplicationRecord
  validates :name, presence: true, length: { maximum: 256 }
  validates :memo, length: { maximum: 1024 }
  validates :geog, presence: true, uniqueness: true
end
