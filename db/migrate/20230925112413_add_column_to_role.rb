class AddColumnToRole < ActiveRecord::Migration[7.0]
  def change
    add_column :roles, :name, :string
  end
end
