class ChangeColumnListedBy < ActiveRecord::Migration[7.0]
  def change
            change_column :properties,:listed_by,:string
  end
end
