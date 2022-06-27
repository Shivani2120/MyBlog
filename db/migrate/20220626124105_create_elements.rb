class CreateElements < ActiveRecord::Migration[6.1]
  def change
    create_table :elements do |t|
      t.string :element_type
      t.text :content
      t.integer :post_id
      t.integer :position

      t.timestamps
    end
  end
end
