class AddStatusAndAmount < ActiveRecord::Migration[7.0]
  def change
    add_column :payments , :status , :string
    add_column :payments , :amount ,:integer
  end
end
