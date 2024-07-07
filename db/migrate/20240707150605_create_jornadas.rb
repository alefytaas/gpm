class CreateJornadas < ActiveRecord::Migration[7.1]
  def change
    create_table :jornadas do |t|
      t.date :data
      t.string :turno
      t.references :user, null: false, foreign_key: true
      t.references :escala, null: false, foreign_key: true

      t.timestamps
    end
  end
end
