require 'test_helper'

class ProviderTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "create" do
    p = Provider.new({
      :name => 'provider 1',
      :address => 'pr1_addr',
      :ratio => 100.0
    })
    assert p.save, true
    
    p = Provider.new({
      :name => 'provider 2',
      :address => 'pr2_addr'
    })
    assert p.save, true
  end
end
