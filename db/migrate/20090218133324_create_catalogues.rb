class CreateCatalogues < ActiveRecord::Migration
  def self.up
    create_table :catalogues do |t|
      t.column :name, :text, :null => false
      t.column :info, :text
      
      t.timestamps
    end

    if ActiveRecord::Base::connection.kind_of?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
      execute('ALTER TABLE catalogues
                  ADD CONSTRAINT catalogues_name_u
                  UNIQUE(name)')
    end
  end

  def self.down
    drop_table :catalogues
  end
end
