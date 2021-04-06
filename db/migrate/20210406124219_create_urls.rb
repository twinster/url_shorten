class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :domain  , null: false
      t.text :url       , null: false
      t.string :shorten , null: false
    end
  end
end
