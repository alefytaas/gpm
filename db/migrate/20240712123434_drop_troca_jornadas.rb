class DropTrocaJornadas < ActiveRecord::Migration[7.1]
  def change
    drop_table :troca_jornadas
  end
end
