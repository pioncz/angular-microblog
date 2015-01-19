class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :email
      t.string :password
      t.integer :last_login
      t.string :photo
      t.string :background_photo
      t.text :description
      t.boolean :is_private
      t.integer :followers
      t.integer :followees
      t.integer :reports

      t.timestamps
    end
  end
end
