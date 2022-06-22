class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :list_image
      t.integer :price
      t.text :description
      t.integer :condition
      t.boolean :sold
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
