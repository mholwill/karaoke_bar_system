class Bar

  attr_reader :name, :room_list, :entry_fee

  def initialize(name, room_list, till_total, entry_fee)
    @name = name
    @room_list = room_list
    @till_total = till_total
    @entry_fee = entry_fee
  end

  def money_in_till
    return @till_total
  end

  def increase_money_in_till(amount)
    @till_total += amount
  end

  def check_id(guest)
    if guest.age >= 18
      return "PASS"
    else
      return "NO SERVICE"
    end
  end

end
