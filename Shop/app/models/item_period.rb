class ItemPeriod < ActiveRecord::Base
  validates_presence_of :start_date,
    :message => 'Должны быть указана дата начала периода действия цены'
  validates_presence_of :price,
    :message => 'Должны быть указана цена товара'
  validates_presence_of :item_id,
    :message => 'Должен быть указан номер товара'
  validates_numericality_of :price, :allow_nil => true, 
    :less_than => 1000000, :greater_than => 0,
    :message => 'Цена должна быть положительным числом (копейки от рублей отделяются точкой) < 1000000'
  validates_associated :item,
    :message => 'Должен быть указан существующий товар'

  belongs_to :item

  def before_validation()
    self.attribute_names.each do |n|
      self[n] = self[n].strip if self[n].kind_of?(String)
    end
  end
end
