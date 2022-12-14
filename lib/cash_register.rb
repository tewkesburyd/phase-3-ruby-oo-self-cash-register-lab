require 'pry'

class CashRegister 

    attr_accessor :discount, :total, :items, :last_transaction

    def initialize (discount = 0)
        @discount = discount
        @total = 0 
        @items = []
    end

    def add_item title, price, quantity = 1
        @title = title
        @quantity = 1
        self.last_transaction = price * quantity
        self.total = self.total + (price * quantity)
        quantity.times do
            self.items << title
        end
    end

    def apply_discount
        if discount > 0
            self.total = self.total.to_f * (1.to_f - (self.discount.to_f/100.to_f))
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = self.total - self.last_transaction
    end

end

