require 'test_helper'

class ItemStorageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    is = ItemStorage.new({
      :quantity => 2,
      :storage_id => 1,
      :item_id => 1
    })
    assert is.save, true
    
    is = ItemStorage.new({
      :quantity => 3,
      :storage_id => 1,
      :item_id => 2
    })
    assert is.save, true
    
    is = ItemStorage.new({
      :quantity => 5,
      :storage_id => 2,
      :item_id => 1
    })
    assert is.save, true
    
  end
end
