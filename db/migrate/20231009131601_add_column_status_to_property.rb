class AddColumnStatusToProperty < ActiveRecord::Migration[7.0]
  def change
    rename_column :properties,:location,:address
    add_column :properties,:availability_status,:integer, default:0
  end
end
