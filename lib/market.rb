class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    vendors_with_item = []
    @vendors.find do |vendor|
      # require "pry"; binding.pry
      if !vendor.inventory[item].zero?
        vendors_with_item << vendor
      end
    end
    vendors_with_item
  end
end
