class CreateFurimas < ActiveRecord::Migration[6.0]
  def change
    create_table :furimas do |t|
      t.string          :product,               null: false
      t.text            :content,               null: false
      t.integer         :price,                 null: false
      t.integer         :category_id,           null: false
      t.integer         :condition_id,          null: false
      t.integer         :delivery_charge_id,    null: false
      t.integer         :prefecture_id,         null: false
      t.integer         :time_required_id,      null: false
      t.timestamps
    end
  end
end
