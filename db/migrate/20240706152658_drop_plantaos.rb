class DropPlantaos < ActiveRecord::Migration[7.1]
  def change
    drop_table :plantaos
  end
end
