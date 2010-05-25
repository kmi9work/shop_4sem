require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "create" do
    assert true
=begin
    it = Item.new({
      :name => 'Товар 1 каталог 1',
      :size_x => 100,
      :size_y => 200,
      :size_z => 10,
      :weight => 15,
      :prms => {'prms1_xzxz' => 'lol'},
      :catalogue_id => 1
    })
    assert it.save, true
    
    it = Item.new({
      :name => 'Товар 2 каталог 1',
      :size_x => 10,
      :size_y => 20,
      :size_z => 1,
      :weight => 150,
      :prms => {'prms2_xzxz' => 'lol1'},
      :catalogue_id => 1
    })
    assert it.save, true
    
    it = Item.new({
      :name => 'Товар 1 каталог 2',
      :size_x => 20,
      :size_y => 20,
      :size_z => 10,
      :weight => 1,
      :prms => {'prms3_xzxz' => 'lol2'},
      :catalogue_id => 2
    })
    assert it.save, true
=end
  end
end
