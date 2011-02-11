class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :name
      t.string :pclass
      t.integer :position, :default => "0"

    end
  end

  def self.down
    drop_table :members
  end
end
