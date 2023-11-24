class AddBookedInPaymentHistory < ActiveRecord::Migration[7.0]
  def change
    add_column :payment_histories , :booked ,:date
  end
end
