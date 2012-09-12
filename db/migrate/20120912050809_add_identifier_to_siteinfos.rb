class AddIdentifierToSiteinfos < ActiveRecord::Migration
  def change
    add_column :siteinfos, :identifier, :string
  end
end
