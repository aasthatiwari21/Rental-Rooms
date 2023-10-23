class AddColumnToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :contact, :string
    add_column :users, :email, :string
    add_column :users, :username, :string
    add_column :users, :password, :string
    add_column :users, :role, :string
  end
end
