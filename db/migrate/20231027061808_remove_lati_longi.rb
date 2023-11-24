class RemoveLatiLongi < ActiveRecord::Migration[7.0]
  def change
    remove_column :properties , :latitute ,:float
    remove_column :properties , :longitude ,:float
    remove_column :properties , :booked, :boolean
    remove_column :properties , :payment_intent_id ,:string
  end
end
