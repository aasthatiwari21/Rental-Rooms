class AddPaymentIntentIdToProperty < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :payment_intent_id, :string
  end
end
