class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.string :boss
      t.integer :itemid
      t.integer :heroicid
      t.boolean :heroic
      
      t.timestamps

    end
    add_index :items, :name
  end

  def self.down
    drop_table :items
  end
end
