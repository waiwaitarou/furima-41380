class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|
      t.integer :postal_code
      t.integer :prefecture_id
      t.string :building_name
      t.string :city
      t.string :region_of_origin
      t.string :tel_number
      t.references :sell_record, null: false, foreign_key: true

      t.timestamps
    end
  end
end
