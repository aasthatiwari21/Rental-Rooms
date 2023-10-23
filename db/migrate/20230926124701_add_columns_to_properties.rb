class AddColumnsToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :property_type, :integer,default:0
    add_column :properties, :furnishing, :integer,default:0
    add_column :properties, :size, :string
    add_column :properties, :bathroom, :integer
    add_column :properties, :bedroom, :integer
    add_column :properties, :rent, :integer
    add_column :properties, :location, :string
    add_column :properties, :resident_type, :integer ,default:0
    add_column :properties, :description, :text
  end
end
