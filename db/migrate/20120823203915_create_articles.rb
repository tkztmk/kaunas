class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :document_title
      t.text :document
      t.text :tag
      t.text :document_type
      t.datatime :document_updated_at
      t.text :document_metadata

      t.timestamps
    end
  end
end
