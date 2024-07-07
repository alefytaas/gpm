class User < ApplicationRecord
  has_many :escala_users , dependent: :destroy
  has_many :escalas, through: :escala_users
  has_many :jornadas, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
