class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :summary
      t.text :content
      t.string :reading_time
      t.string :image
      t.datetime :published_at
      t.boolean :archived
      t.timestamps
    end
  end
end
