class Storage < ActiveRecord::Base
  validates_presence_of :name,
    :message => 'Должно быть указано название склада'
  validates_uniqueness_of :name,
    :message => 'Название склада должно быть уникально'

  has_many :item_storages, :dependent => :destroy

  def before_validation()
    self.attribute_names.each do |n|
      self[n] = self[n].strip if self[n].kind_of?(String)
    end
  end
end
