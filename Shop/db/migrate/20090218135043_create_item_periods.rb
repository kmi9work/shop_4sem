class CreateItemPeriods < ActiveRecord::Migration
  def self.up
    create_table :item_periods do |t|
      t.column :start_date, :date, :null => false
      t.column :end_date, :date
      t.column :price, :float, :null => false

      t.references :item, :null => false

      t.timestamps
    end

    if ActiveRecord::Base::connection.kind_of?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
      execute('ALTER TABLE item_periods
                  ADD CONSTRAINT item_periods_item_id_fk
                  FOREIGN KEY(item_id)
                  REFERENCES items(id)')
    end
  end

  def self.down
    drop_table :item_periods
  end
end
