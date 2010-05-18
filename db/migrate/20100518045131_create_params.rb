class CreateParams < ActiveRecord::Migration
  def self.up
    create_table :params do |t|
      t.column :key, :text, :null => false
      t.column :value, :text, :null => false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :params
  end
end
