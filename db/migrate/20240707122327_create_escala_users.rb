class CreateEscalaUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :escala_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :escala, null: false, foreign_key: true

      t.timestamps
    end
  end
end
