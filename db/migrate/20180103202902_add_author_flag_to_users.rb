class AddAuthorFlagToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :author, :boolean, default: true, null: false
  end
end
