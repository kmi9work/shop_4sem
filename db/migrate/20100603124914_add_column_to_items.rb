class AddColumnToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :buy_count, :integer, :default => 0
  end

  def self.down
    delete_column :items, :buy_count
  end
end
