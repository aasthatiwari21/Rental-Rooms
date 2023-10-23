class AddNameToPropertyType < ActiveRecord::Migration[7.0]
  def change
    add_column :property_types, :name, :string
  end
end
