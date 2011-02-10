class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :name
      t.string :link
      t.string :pclass

    end
  end

  def self.down
    drop_table :members
  end
end
