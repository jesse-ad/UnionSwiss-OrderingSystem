class CreateSkus < ActiveRecord::Migration[8.0]
  def change
    create_table :skus do |t|
      t.references :distributor, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.decimal :price_per_unit

      t.timestamps
    end
  end
end
