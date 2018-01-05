class CreateSubscribes < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribes do |t|
      t.string :email
      t.string :subscriber_name

      t.timestamps
    end
  end
end
