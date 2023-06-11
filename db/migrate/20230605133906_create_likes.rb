class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :like
      t.integer :member_id
      t.integer :review_id
      t.timestamps
    end
  end
end
