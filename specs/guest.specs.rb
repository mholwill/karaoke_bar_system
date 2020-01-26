require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')
require_relative('../songs')
require_relative('../bar')
require_relative('../rooms')

class GuestTest < Minitest::Test

  def setup
    @song1 = Songs.new("Hey Jude")
    @room1 = Rooms.new("Pop", @song1, 2)
    @guest1 = Guest.new("Graham", 23, 150, "Hey Jude")
    @bar1 = Bar.new("Rubber Ducky", @room1, 300, 10)
  end

  def test_get_guest_name
    assert_equal("Graham", @guest1.name)
  end

  def test_get_age
    assert_equal(23, @guest1.age)
  end

  def test_get_wallet_amount
    assert_equal(150, @guest1.money_in_wallet)
  end

  def test_spend_money
    @guest1.spend_money(45)
    assert_equal(105, @guest1.money_in_wallet)
  end

  def test_get_favourite_song
    assert_equal("Hey Jude", @guest1.favourite_song)
  end

  def test_pay_entry_fee
    @guest1.pay_entry_fee(@bar1)
    assert_equal(310, @bar1.money_in_till)
    assert_equal(140, @guest1.money_in_wallet)
  end

  def test_pay_bar_tab
    @guest2 = Guest.new("Sam", 18, 40, "Hurt")
    @guest1.setup_bar_tab(@room1, 25)
    @guest2.setup_bar_tab(@room1, 25)
    assert_equal(125, @guest1.money_in_wallet)
    assert_equal(15, @guest2.money_in_wallet)
    assert_equal(350, @bar1.till_total)
    assert_equal(50, @room1.bar_tab)
  end


end
