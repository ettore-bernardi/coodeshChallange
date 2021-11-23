class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.boolean :featured
      t.string :title
      t.string :url
      t.string :imageUrl
      t.string :newsSite
      t.string :sumary
      t.string :publishedAt

      t.timestamps
    end
  end
end
