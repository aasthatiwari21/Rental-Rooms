class AddLatiLongiToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :latitute, :float
    add_column :properties, :longitude, :float
    add_column :properties ,:listed_by,:string
  end
end
