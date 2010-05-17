require 'test_helper'

class ItemPeriodTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "create" do
    ip = ItemPeriod.new({
      :start_date => Time.now,
      :end_date => Time.now + 3600,  
      :price => 100,     
      :item_id => 1   
    })
    assert ip.save, true
    ip = ItemPeriod.new({
      :start_date => Time.now  + 7200,
      :end_date => Time.now + 3600  + 7200,  
      :price => 1000,     
      :item_id => 1
    })
    assert ip.save, true
    
    ip = ItemPeriod.new({
      :start_date => Time.now,
      :end_date => Time.now + 3600,  
      :price => 1000,     
      :item_id => 2   
    })
    assert ip.save, true
    
    ip = ItemPeriod.new({
      :start_date => Time.now + 3600,
      :end_date => Time.now + 7200,  
      :price => 1000,     
      :item_id => 2   
    })
    assert ip.save, true
    
  end
end
