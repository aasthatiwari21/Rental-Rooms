class RemovePropertyTypeFromProperty < ActiveRecord::Migration[7.0]
  def change
    remove_column :properties, :property_type, :integer
    
  end
end
