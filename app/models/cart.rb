class Cart

  def initialize items
    @items = items
  end

  def items
    @items
  end

  def add_item item
    items.append(item)
  end

  def actual_price item
    item[:price] * item[:quantity]
  end

  def price_with_tax item
    price = actual_price(item)
    if tax_rate(item)
      price + ((tax_rate(item) / 100) * price)
    else
      price
    end
  end

  def total
    items.reduce(0) {|memo, item| memo += price_with_tax(item)}
  end

  def rounded_total
    round_to(total)
  end

  private
    def tax_rate item
      tax = TaxRate.where(state: item[:location]).first
      tax ? tax.rate : nil
    end

    def round_to(num, incr=0.05)
      (num / incr).round * incr
    end
end
