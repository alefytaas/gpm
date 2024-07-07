class Escala < ApplicationRecord
    has_many :escala_users, dependent: :destroy
    has_many :users, through: :escala_users
    has_many :jornadas, dependent: :destroy
end
