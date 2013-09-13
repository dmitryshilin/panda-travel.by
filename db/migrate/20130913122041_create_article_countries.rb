class CreateArticleCountries < ActiveRecord::Migration
  def change
    create_table :article_countries do |t|
      t.references :country, index: true
      t.references :article, index: true

      t.timestamps
    end
  end
end
