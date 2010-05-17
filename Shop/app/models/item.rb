class Item < ActiveRecord::Base
  validates_presence_of :name,
    :message => 'Название товара не может быть пустым'
  validates_numericality_of :size_x, :allow_nil => true, 
    :less_than => 10000, :greater_than => 0,
    :message => 'Размер товара по оси X должен быть положительным числом < 10000'
  validates_numericality_of :size_y, :allow_nil => true, 
    :less_than => 10000, :greater_than => 0,
    :message => 'Размер товара по оси Y должен быть положительным числом < 10000'
  validates_numericality_of :size_z, :allow_nil => true, 
    :less_than => 10000, :greater_than => 0,
    :message => 'Размер товара по оси Z должен быть положительным числом < 10000'
  validates_numericality_of :weight, :allow_nil => true, 
    :less_than => 10000, :greater_than => 0,
    :message => 'Вес товара должен быть положительным числом < 10000'

  validates_associated :catalogue,
    :message => 'Должен быть указан существующий каталог'

  belongs_to :catalogue
  has_many :item_periods, :dependent => :destroy
  has_many :item_storages, :dependent => :destroy
  has_many :providings, :dependent => :destroy

  serialize :prms, Hash

  def catalogue_name()
    self.catalogue.nil? ? '' : self.catalogue.name
  end

  def price()
    return 'Уточните у менеджера' if self.item_periods.empty?
    d = Date.parse(Time.now.strftime('%Y-%m-%d'))
    good_periods = self.item_periods.select do |p|
      p.start_date <= d and (p.end_date.nil? or p.end_date >= d)
    end
    good_periods = good_periods.sort{ |a, b| a.start_date <=> b.start_date }
    return 'Уточните у менеджера' if good_periods.empty?
    return good_periods.last.price.to_s + ' руб.'
  end

  def quantity()
    return 'Нет в наличии' if self.item_storages.empty?
    return self.item_storages.inject(0){ |s, i| s += i.quantity }
  end

  def before_validation()
    self.attribute_names.each do |n|
      self[n] = self[n].strip if self[n].kind_of?(String)
    end
  end
end
