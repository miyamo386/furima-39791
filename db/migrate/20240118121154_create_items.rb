class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :item_name,             null: false
      t.text       :item_description,      null: false
      t.integer    :price,                 null: false
      t.references :user,                  null: false, foreign_key: true
      t.integer    :category_id,           null: false
      t.integer    :item_status_id,        null: false
      t.integer    :delivery_price_id,     null: false
      t.integer    :prefecture_id,         null: false
      t.integer    :delivery_criterion_id, null: false
      t.timestamps
    end
  end
end
