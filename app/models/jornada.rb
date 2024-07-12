class Jornada < ApplicationRecord
  belongs_to :user
  belongs_to :escala
  has_many :shift_swaps, dependent: :destroy
end
