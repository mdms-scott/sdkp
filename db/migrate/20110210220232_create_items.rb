class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.boolean :spec
      t.string :link
      t.string :boss
      t.integer :member_id
      t.datetime :date

    end
  end

  def self.down
    drop_table :items
  end
end
