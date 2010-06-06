class AddBuyCatCountToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :buy_cat_count, :integer, :default => 0
  end

  def self.down
    delete_column :items, :buy_cat_count
  end
end
