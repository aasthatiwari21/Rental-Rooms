class AddPropertyToPayment < ActiveRecord::Migration[7.0]
  def change
        add_reference :payments, :property, null: false, foreign_key: true
        add_reference :payments, :user, null: false, foreign_key: true

  end
end
