class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :identifier
      t.text :document
      t.text :metadata
      t.timestamps
    end
  end
end
