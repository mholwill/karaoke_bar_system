class Guest

  attr_reader :name, :age, :favourite_song

  def initialize(name, age, wallet, favourite_song)
    @name = name
    @age = age
    @wallet = wallet
    @favourite_song = favourite_song
  end

  def money_in_wallet
    return @wallet
  end

  def spend_money(amount)
      @wallet -= amount
  end

  def pay_entry_fee(bar)
    entry_fee = bar.entry_fee
    spend_money(entry_fee)
    bar.increase_money_in_till(entry_fee)
  end

  def setup_bar_tab(room, amount)
    amount = room.bar_tab
    spend_money(amount)
    bar.increase_money_in_till(amount)
    room.bar_tab(amount)
  end



end
