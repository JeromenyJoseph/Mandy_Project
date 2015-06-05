class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :recipe

      t.timestamps null: false
    end
  end
end
