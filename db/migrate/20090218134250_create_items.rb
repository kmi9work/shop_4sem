class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.column :name, :text, :null => false
      t.column :size_x, :float
      t.column :size_y, :float
      t.column :size_z, :float
      t.column :weight, :float
      
      t.references :param
      t.references :catalogue

      t.timestamps
    end

    if ActiveRecord::Base::connection.kind_of?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
      execute('ALTER TABLE items
                  ADD CONSTRAINT items_catalogue_id_fk
                  FOREIGN KEY(catalogue_id)
                  REFERENCES catalogues(id)')
      execute('ALTER TABLE items
                  ADD CONSTRAINT items_param_id_fk
                  FOREIGN KEY(param_id)
                  REFERENCES params(id)')            
    end
  end

  def self.down
    drop_table :items
  end
end
