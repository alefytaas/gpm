class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :escala_users , dependent: :destroy
  has_many :escalas, through: :escala_users
  has_many :jornadas, dependent: :destroy
   has_many :requested_shift_swaps, class_name: 'ShiftSwap', foreign_key: 'requesting_doctor_id'
  has_many :received_shift_swaps, class_name: 'ShiftSwap', foreign_key: 'receiving_doctor_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
