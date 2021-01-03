class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.timestamps
      t.string :name
      t.string :introduce
      t.integer :category_id
      t.integer :condition_id
      t.integer :status_id
      t.integer :delivery_fee_id
      t.integer :prefecture_id
      t.integer :delivery_days_id 
      t.integer :price
    end
  end
end
