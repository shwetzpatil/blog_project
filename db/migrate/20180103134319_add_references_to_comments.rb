class AddReferencesToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :user, index: true
    add_index :comments, :article
  end
end
