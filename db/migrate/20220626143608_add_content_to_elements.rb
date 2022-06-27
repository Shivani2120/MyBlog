class AddContentToElements < ActiveRecord::Migration[6.1]
  def change
    add_column :elements, :content, :text
  end
end
