class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :short_title
      t.string :title
      t.text :content
      t.boolean :published
      t.attachment :poster

      t.timestamps
    end
  end
end
