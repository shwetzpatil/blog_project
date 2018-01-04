class RemoveColumnContactNoInUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :contact_no, :integer
  end
end
