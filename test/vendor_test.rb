require "minitest/autorun"
require "minitest/pride"
require "./lib/vendor"

class VendorTest < Minitest::Test
  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  def test_it_exists
    assert_instance_of Vendor, @vendor
  end

  def test_it_has_a_name
    assert_equal "Rocky Mountain Fresh", @vendor.name
  end

  def test_it_has_default_zero_inventory
    assert_equal ({}), @vendor.inventory
    assert_equal 0, @vendor.check_stock("Peaches")
  end

  def test_stock_can_be_added
    vendor.stock("Peaches", 30)
    #=> 30

    assert_equal 30, vendor.check_stock("Peaches")
    #=> 30

    # vendor.stock("Peaches", 25)
    # #=> 55
    #
    # assert_equal 55, vendor.check_stock("Peaches")
    # #=> 55
    #
    # vendor.stock("Tomatoes", 12)
    #
    # assert_equal 12, vendor.check_stock("Tomatoes")
  end
end
