class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :code
      t.string :description
      t.integer :category_id

      t.timestamps
    end
  end
end
