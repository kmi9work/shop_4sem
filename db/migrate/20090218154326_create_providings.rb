class CreateProvidings < ActiveRecord::Migration
  def self.up
    create_table :providings do |t|
      t.column :providing_date, :date, :null => false
      t.column :quantity, :integer, :null => false
      t.column :price, :float, :null => false
      t.column :contract, :text, :null => false

      t.references :provider, :null => false
      t.references :item, :null => false

      t.timestamps
    end

    if ActiveRecord::Base::connection.kind_of?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
      execute('ALTER TABLE providings
                  ADD CONSTRAINT providings_provider_id_fk
                  FOREIGN KEY(provider_id)
                  REFERENCES providers(id)')
      execute('ALTER TABLE providings
                  ADD CONSTRAINT providings_item_id_fk
                  FOREIGN KEY(item_id)
                  REFERENCES items(id)')
    end
  end

  def self.down
    drop_table :providings
  end
end
