class ChangeColumnSize < ActiveRecord::Migration[7.0]
  def change
    rename_column :properties, :size, :size_sq_ft
  end   
end