class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false 
      t.text :content, null: false 
      t.string :slug, null: false, unique: true

      t.timestamps
    end
  end
end
