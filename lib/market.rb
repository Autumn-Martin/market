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
    # require "pry"; binding.pry
  end

  def get_amounts
    @vendors.map do |vendor|
      vendor.inventory.values
    end.flatten
  end

  def sorted_item_list
    items = get_items
    items.sort_by do |item|
      item
    end.uniq
  end

  # def item_amount_pairs
  #   get_items.zip(get_amounts).flatten
  # #=> [["Peaches", 35], ["Tomatoes", 7], ["Banana Nice Cream", 50], ["Peach-Raspberry Nice Cream", 25], ["Peaches", 65]]
  # end
  #
  # def total_inventory
  #   total_inventory[item_amount_pairs[0]] = item_amount_pairs[1]
  # end

  def raw_total_inventory
    total_inventory = {}
    @vendors.map do |vendor|
      # require "pry"; binding.pry
      total_inventory[vendor.inventory.keys] = vendor.inventory.values
    end
    # require "pry"; binding.pry
    return total_inventory
    #=> {["Peaches", "Tomatoes"]=>[35, 7], ["Banana Nice Cream", "Peach-Raspberry Nice Cream"]=>[50, 25], ["Peaches"]=>[65]}
    # require "pry"; binding.pry
  end


  def total_inventory
    total_inventory = {}
    raw_total_inventory.map do |pair|
      # require "pry"; binding.pry
      total_inventory[pair[0][0]] = pair[1][0]
    end
    return total_inventory
  end
  
end
