class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.string :spec
      t.string :link
      t.string :boss
      t.integer :member_id

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end