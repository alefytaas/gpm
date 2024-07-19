class ModifyEscalas < ActiveRecord::Migration[7.1]
  def change
    remove_column :escalas, :cidade, :string

    add_reference :escalas, :hospital, foreign_key: true
  end
end
