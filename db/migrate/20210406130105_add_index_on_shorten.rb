class AddIndexOnShorten < ActiveRecord::Migration[6.0]
  def up
    add_index :urls, :shorten
  end

  def down
    remove_index :urls, :shorten
  end
end
