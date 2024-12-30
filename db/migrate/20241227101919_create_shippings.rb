class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|
      t.integer :postal_code
      t.integer :prefecture_No
      t.string :building_name
      t.string :cityt
      t.integer :prefecture
      t.integer :tel_number
      t.references :sale_record, null: false, foreign_key: true

      t.timestamps
    end
  end
end
