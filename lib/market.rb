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
      if !vendor.inventory[item].zero?
        vendors_with_item << vendor
      end
    end
    vendors_with_item
  end

  def get_items
    @vendors.map do |vendor|
      vendor.inventory.keys
    end.flatten
  end

  def sorted_item_list
    items = get_items
    items.sort_by do |item|
      item
    end.uniq
  end
end
