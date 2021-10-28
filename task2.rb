class ShopInventory
    def initialize(inventory)
        @inventory = inventory
    end
    def item_in_stock
        sorted = @inventory.filter_map{|item| item[:name] unless item[:quantity_by_size].empty?}
        sorted.sort_by! { |a| a }
        return sorted
    end
    def affordable
        result = []
        @inventory.each do |element|
            if element[:price] < 50
                result.push element 
            end 
        end
        return result
    end
    def out_of_stock
        result = []
        @inventory.each do |element|
            if element[:quantity_by_size].empty?
                result.push element
            end 
        end
        return result
    end
    def how_much_left(name)
        result = []
        @inventory.each do |element|
            if element[:name] == name 
                result.push element[:quantity_by_size]  
            end 
        end
        return result
    end
    def total_stock
        sum = 0
        @inventory.each do |element|
            element[:quantity_by_size].each do |key, value|
                 sum += value
            end 
        end
        return sum
    end
end
inventory = [
    {price: 125.00, name: "Cola", quantity_by_size: {l033: 3, l05: 7, l1: 8, l2: 4}},
    {price: 40.00, name: "Pepsi", quantity_by_size: {}},
    {price: 39.99, name: "Water", quantity_by_size: {l033: 1, l2: 4}},
    {price: 70.00, name: "Juice", quantity_by_size: {l033: 7, l05: 2}}
]

test_obj = ShopInventory.new(inventory)
puts "item_in_stock:"
puts "#{test_obj.item_in_stock}\n\n"
puts "affordable:"
puts "#{test_obj.affordable}\n\n"
puts "out_of_stock:"
puts "#{test_obj.out_of_stock}\n\n"
puts "how_much_left:"
puts "#{test_obj.how_much_left("Cola")}\n\n"
puts "total_stock:"
puts "#{test_obj.total_stock}"