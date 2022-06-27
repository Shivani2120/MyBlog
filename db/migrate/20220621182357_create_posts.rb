class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.datetime :published_at
      t.boolean :published
      t.integer :author_id

      t.timestamps
    end
  end
end
