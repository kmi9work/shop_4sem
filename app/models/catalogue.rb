class Catalogue < ActiveRecord::Base
  validates_presence_of :name,
    :message => 'Должно быть указано название каталога'
  validates_uniqueness_of :name,
    :message => 'Название каталога должно быть уникальным'

  has_many :items, :dependent => :nullify

  def before_validation()
    self.attribute_names.each do |n|
      self[n] = self[n].strip if self[n].kind_of?(String)
    end
  end
end
