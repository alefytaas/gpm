class Escala < ApplicationRecord
    has_many :escala_users, dependent: :destroy
    has_many :users, through: :escala_users
    has_many :jornadas, dependent: :destroy
    belongs_to :hospital

    validates :id_medico_adm, presence: true
    validates :mes_ref, presence: true
    validates :setor, presence: true
    validates :val_jornada, presence: true

end
