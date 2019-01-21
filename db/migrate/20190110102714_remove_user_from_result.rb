class RemoveUserFromResult < ActiveRecord::Migration[5.2]
  def change
    remove_column :results, :user_id
    add_column :results, :victor_id, :integer
    add_column :results, :defeated_id, :integer
  end
end
