class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :dt_nasc, :date
    add_column :users, :user_type, :string
  end
end
