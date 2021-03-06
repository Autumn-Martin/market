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

  def test_it_has_default_zero_inventory_and_stock
    assert_equal ({}), @vendor.inventory
    assert_equal 0, @vendor.check_stock("Peaches")
  end

  def test_stock_and_inventory_can_be_added
    @vendor.stock("Peaches", 30)

    assert_equal 30, @vendor.check_stock("Peaches")

    @vendor.stock("Peaches", 25)

    assert_equal 55, @vendor.check_stock("Peaches")
  end

  def test_inventory_can_be_added
    @vendor.stock("Peaches", 30)
    @vendor.stock("Peaches", 25)
    @vendor.stock("Tomatoes", 12)

    assert_equal ({"Peaches"=>55, "Tomatoes"=>12}), @vendor.inventory
  end
end
