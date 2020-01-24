require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')
require_relative('../songs')
require_relative('../bar')

class GuestTest < Minitest::Test

  def setup
    @song1 = Songs.new("Hey Jude")
    @guest1 = Guest.new("Graham", 23, 150, "Hey Jude")
    @bar1 = Bar.new("Rubber Ducky", @rooms, 300, 10)
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

end
