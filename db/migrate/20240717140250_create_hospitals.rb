class CreateHospitals < ActiveRecord::Migration[7.1]
  def change
    create_table :hospitals do |t|
      t.string :nome_hospital
      t.string :cidade
      t.text :setores, array: true, default: []

      t.timestamps
    end
  end
end
