class Provider < ActiveRecord::Base
  validates_presence_of :name,
    :message => 'Должно быть указано название поставщика'
  validates_presence_of :address,
    :message => 'Должен быть указан юридический адрес поставщика'
  validates_numericality_of :ratio, :allow_nil => false,
    :less_or_equal_than => 100, :greater_or_equal_than => 0,
    :message => 'Коэффициент доверия поставщику должен быть положительным числом < 100'
  has_many :providings, :dependent => :destroy

  def before_validation()
    self.attribute_names.each do |n|
      self[n] = self[n].strip if self[n].kind_of?(String)
    end
  end
end
