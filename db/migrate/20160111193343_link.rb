class Link < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :title
      t.string :boolean, :default => false

      t.timestamps null: false
    end
  end
end
