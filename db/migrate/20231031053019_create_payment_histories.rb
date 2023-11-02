class CreatePaymentHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_histories do |t|
      t.references :property, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
