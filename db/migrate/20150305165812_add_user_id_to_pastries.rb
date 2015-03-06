class AddUserIdToPastries < ActiveRecord::Migration
  def change
    add_column :pastries, :user_id, :integer
    add_index :pastries, :user_id
  end
end
