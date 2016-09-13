class Cart

  def initialize items
    @items = items
  end

  def items
    @items
  end

  def clear
    items.clear
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
    round_to(total).round(2)
  end

  private
    def tax_rate item
      tax_detail = TaxRate.where(state: item[:state]).first
      if tax_detail and tax_detail.exempted_category_ids.exclude? item[:category_id]
        tax_detail.rate
      end
    end

    def round_to(num, incr=0.05)
      (num / incr).round * incr
    end
end
