class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :summary
      t.string :github_url
      t.string :website_url
      t.text :content
      t.string :image
      t.boolean :archived
      t.timestamps
    end
  end
end
