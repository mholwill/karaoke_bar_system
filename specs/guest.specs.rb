require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')
require_relative('../songs')

class GuestTest < Minitest::Test

  def setup
    @song1 = Songs.new("Hey Jude")
    @guest1 = Guest.new("Graham", 23, 150, "Hey Jude")
  end

  def test_get_guest_name
    assert_equal("Graham", @guest1.name)
  end

  def test_get_age
    assert_equal(23, @guest1.age)
  end

  def test_get_wallet_amount
    assert_equal(150, @guest1.wallet)
  end

  def test_get_favourite_song
    assert_equal("Hey Jude", @guest1.favourite_song)
  end

end
