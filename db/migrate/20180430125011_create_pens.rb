class CreatePens < ActiveRecord::Migration[5.1]
  def change
    create_table :pens do |t|
      t.string :name
      t.text :summary
      t.string :codepen_url
      t.string :image
      t.boolean :archived
      t.timestamps
    end
  end
end
