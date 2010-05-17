require 'test_helper'

class ProvidingTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    p = Providing.new({
      :providing_date => Time.now,
      :quantity => 2,
      :price => 150, 
      :contract => 'per1_i1_ping1',
      :provider_id => 1,
      :item_id => 1
    })
    assert p.save, true
    
    p = Providing.new({
      :providing_date => Time.now + 3600,
      :quantity => 3,
      :price => 1500, 
      :contract => 'per2_i1_ping2',
      :provider_id => 2,
      :item_id => 1
    })
    assert p.save, true
    
    p = Providing.new({
      :providing_date => Time.now + 7200,
      :quantity => 5,
      :price => 15, 
      :contract => 'per1_i2_ping3',
      :provider_id => 1,
      :item_id => 2
    })
    assert p.save, true
  end
end
