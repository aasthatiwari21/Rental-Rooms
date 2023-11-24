class AddBookedToProperty < ActiveRecord::Migration[7.0]
  def change
    add_column :properties,:booked,:boolean
  end
end
