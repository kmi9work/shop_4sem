class AddMinPriceToCatalogues < ActiveRecord::Migration
  def self.up
    add_column :catalogues, :min_buy_count, :integer
  end

  def self.down
    delete_column :catalogues, :min_buy_count
  end
end
