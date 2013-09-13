class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :short_title
      t.string :title
      t.text :content
      t.boolean :published

      t.timestamps
    end
  end
end
