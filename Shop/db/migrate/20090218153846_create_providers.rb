class CreateProviders < ActiveRecord::Migration
  def self.up
    create_table :providers do |t|
      t.column :name, :text, :null => false
      # Юридический адрес
      t.column :address, :text, :null => false
      # Коэффициент доверия в %
      t.column :ratio, :float, :default => 50, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :providers
  end
end
