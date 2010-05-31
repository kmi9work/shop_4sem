class ItemStorage < ActiveRecord::Base
  validates_presence_of :storage_id,
    :message => 'Должен быть указан склад'
  validates_presence_of :item_id,
    :message => 'Должен быть указан товар'
  validates_numericality_of :quantity, :allow_nil => false,
    :less_than => 1000000, :greater_or_equal_than => 0,
    :message => 'Количество товаров должно быть положительным числом < 1000000'

  validates_associated :storage,
    :message => 'Должен быть указан номер существующего склада'
  validates_associated :item,
    :message => 'Должен быть указан номер существующего товара'

  validates_uniqueness_of :item_id, :scope => :storage_id,
    :message => 'Нельзя размещать товар на одном и том же складе дважды'

  belongs_to :item
  belongs_to :storage

  def storage_name()
    self.storage.nil? ? '' : self.storage.name
  end

  def before_validation()
    self.attribute_names.each do |n|
      self[n] = self[n].strip if self[n].kind_of?(String)
    end
  end
end
