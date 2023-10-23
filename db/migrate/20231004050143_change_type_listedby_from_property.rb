class ChangeTypeListedbyFromProperty < ActiveRecord::Migration[7.0]
  def change
    change_column :properties,:listed_by,:integer
  end
end
