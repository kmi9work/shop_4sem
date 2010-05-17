class CreateStorages < ActiveRecord::Migration
  def self.up
    create_table :storages do |t|
      t.column :name, :text, :null => :false
      t.column :info, :text

      t.timestamps
    end

    if ActiveRecord::Base::connection.kind_of?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
      execute('ALTER TABLE storages
                  ADD CONSTRAINT storages_name_u
                  UNIQUE(name)')
    end
  end

  def self.down
    drop_table :storages
  end
end
