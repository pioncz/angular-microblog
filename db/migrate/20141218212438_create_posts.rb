class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :type
      t.text :content
      t.integer :comments_count
      t.integer :score
      t.integer :user_id
      t.integer :reports

      t.timestamps
    end
  end
end
