class DropEscalas < ActiveRecord::Migration[7.1]
  def change
    drop_table :escalas
  end
end
