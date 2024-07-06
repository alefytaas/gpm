class CreateEscalas < ActiveRecord::Migration[7.1]
  def change
    create_table :escalas do |t|
      t.integer :id_medico_adm
      t.string :setor
      t.date :mes_ref

      t.timestamps
    end
  end
end
