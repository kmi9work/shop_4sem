class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.text :key
      t.text :value
      
      t.references :item, :null => false
      t.timestamps
    end
    if ActiveRecord::Base::connection.kind_of?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
      execute('ALTER TABLE properties
                ADD CONSTRAINT properties_items_id_fk
                FOREIGN KEY(item_id)
                REFERENCES items(id)')
    end
  end

  def self.down
    drop_table :properties
  end
end
