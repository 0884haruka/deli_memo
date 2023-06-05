class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title,  null: false
      t.text :body,  null: false
      t.integer :price,  null: false
      t.integer :prefecture_id,  null: false
      t.integer :food_id,  null: false
      t.timestamps
    end
  end
end
