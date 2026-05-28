class CreateDistributors < ActiveRecord::Migration[8.0]
  def change
    create_table :distributors do |t|
      t.string :name
      t.string :currency

      t.timestamps
    end
  end
end
