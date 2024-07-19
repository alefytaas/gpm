class AddDetailsToEscalas < ActiveRecord::Migration[7.1]
  def change
    add_column :escalas, :val_jornada, :float
    add_column :escalas, :hospital, :string
    add_column :escalas, :cidade, :string
  end
end
