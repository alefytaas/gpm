class CreateShiftSwaps < ActiveRecord::Migration[7.1]
  def change
    create_table :shift_swaps do |t|
      t.references :requesting_doctor, null: false, foreign_key: { to_table: :users }
      t.references :receiving_doctor, null: false, foreign_key: { to_table: :users }
      t.references :jornada, null: false, foreign_key: true
      t.string :status, default: 'pending'

      t.timestamps
    end
  end
end
