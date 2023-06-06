class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title,  null: false
      t.text :body,  null: false
      t.integer :price,  null: false
      t.integer :prefecture,  null: false, default: 0
      t.integer :food_category,  null: false, default: 0
      t.timestamps
    end
  end
end
