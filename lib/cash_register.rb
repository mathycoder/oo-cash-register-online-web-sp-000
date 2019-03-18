require 'pry'

class CashRegister
  attr_accessor :total, :discount, :last_transaction, :items 
  
  
  def initialize(discount=0)
    @discount = discount
    @total = 0
    @items = []
  end 

  
  def add_item(title,price, quantity=1)
    self.total += price * quantity
    self.last_transaction = price * quantity 
    (1..quantity).to_a.each {self.items << title}
  end 
  
  def apply_discount
    if self.discount > 0 
      discount = @discount / 100.0 
      self.total -= (self.discount/100.0)*self.total
      "After the discount, the total comes to $#{self.total.to_i}."
    else 
      "There is no discount to apply."
    end 
  end 
  
  def void_last_transaction
    self.total -= self.last_transaction 
  end 
  
end 
