class AddRefToBooking < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :user, null: false, foreign_key: true
    add_reference :bookings, :property, null: false, foreign_key: true
  end
end
