class AddRoleToUser < ActiveRecord::Migration[7.0]
  def change
    # remove_reference :users ,:role
    # add_column :users, :role, :integer
  end
end
