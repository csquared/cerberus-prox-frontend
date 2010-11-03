class CreateAccessGroups < ActiveRecord::Migration
  def self.up
    create_table :access_groups do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :access_groups
  end
end
