class CreateSiteinfos < ActiveRecord::Migration
  def change
    create_table :siteinfos do |t|
      t.text :title
      t.text :contact
      t.text :author

      t.timestamps
    end
  end
end
