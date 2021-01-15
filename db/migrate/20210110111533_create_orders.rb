class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.bigint  :user_id
      t.bigint  :item_id
      t.timestamps
    end
    add_foreign_key :orders, :users
    add_foreign_key :orders, :items
  end
end
