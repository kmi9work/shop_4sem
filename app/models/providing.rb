class Providing < ActiveRecord::Base
  validates_presence_of :providing_date,
    :message => 'Должна быть указана дата поставки'
  validates_presence_of :provider_id,
    :message => 'Должен быть указан поставщик'
  validates_presence_of :item_id,
    :message => 'Должен быть указан товар'
  validates_presence_of :contract,
    :message => 'Не указано информации о контракте'
  validates_numericality_of :quantity, :allow_nil => false,
    :less_than => 1000000, :greater_than => 0,
    :message => 'Количество товаров должно быть положительным числом < 1000000'
  validates_numericality_of :price, :allow_nil => true,
    :less_than => 1000000, :greater_than => 0,
    :message => 'Цена должна быть положительным числом (копейки от рублей отделяются точкой) < 1000000'

  validates_associated :provider,
    :message => 'Должен быть указан существующий поставщик'
  validates_associated :item,
    :message => 'Должен быть указан существующий товар'

  belongs_to :provider
  belongs_to :item

  def before_validation()
    self.attribute_names.each do |n|
      self[n] = self[n].strip if self[n].kind_of?(String)
    end
  end
end
