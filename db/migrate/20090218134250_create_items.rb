class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.column :name, :text, :null => false
      t.column :size_x, :float
      t.column :size_y, :float
      t.column :size_z, :float
      t.column :weight, :float
      t.column :rating, :integer, :default => 0
      t.column :rating_cat, :integer, :default => 0
      
      t.references :property
      t.references :catalogue

      t.timestamps
    end

    if ActiveRecord::Base::connection.kind_of?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
      execute('ALTER TABLE items
                  ADD CONSTRAINT items_catalogue_id_fk
                  FOREIGN KEY(catalogue_id)
                  REFERENCES catalogues(id)')
    end
  end

  def self.down
    drop_table :items
  end
end
