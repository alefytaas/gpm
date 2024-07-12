class ShiftSwap < ApplicationRecord
  belongs_to :requesting_doctor, class_name: 'User'
  belongs_to :receiving_doctor, class_name: 'User'
  belongs_to :jornada

  validates :receiving_doctor_id, presence: true
  validates :status, inclusion: { in: %w[pending approved rejected] }
end
