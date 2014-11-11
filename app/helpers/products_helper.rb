module ProductsHelper

  def print_price(price)
    number_to_currency price
  end

  def print_stock stock
    number_with_delimiter stock  
  end
end


