class BlogUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null:false
      t.string :photo
      t.text :bio
      t.integer :posts_counter, default: 0

      t.timestamps
    end
  end
end
