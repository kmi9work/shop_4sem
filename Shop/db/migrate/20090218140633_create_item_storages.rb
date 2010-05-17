class CreateItemStorages < ActiveRecord::Migration
  def self.up
    create_table :item_storages do |t|
      t.column :quantity, :integer, :null => false
      
      t.references :storage, :null => false
      t.references :item, :null => false

      t.timestamps
    end

    if ActiveRecord::Base::connection.kind_of?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
      execute('ALTER TABLE item_storages
                  ADD CONSTRAINT item_storages_storage_id_item_id_u
                  UNIQUE(storage_id, item_id)')
      execute('ALTER TABLE item_storages
                  ADD CONSTRAINT item_storages_storage_id_fk
                  FOREIGN KEY(storage_id)
                  REFERENCES storages(id)')
      execute('ALTER TABLE item_storages
                  ADD CONSTRAINT item_storages_item_id_fk
                  FOREIGN KEY(item_id)
                  REFERENCES items(id)')
    end
  end

  def self.down
    drop_table :item_storages
  end
end
