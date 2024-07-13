class AddDestinationJornadaIdToShiftSwaps < ActiveRecord::Migration[7.1]
  def change
    add_column :shift_swaps, :jornada_id_destination, :integer
    add_index :shift_swaps, :jornada_id_destination
  end
end
