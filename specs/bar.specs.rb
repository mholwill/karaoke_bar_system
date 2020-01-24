require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bar')
require_relative('../rooms')
require_relative('../guest')
require_relative('../songs')

class BarTest < Minitest::Test

  def setup
    @song1 = Songs.new("99 Problems")
    @song2 = Songs.new("Hey Jude")
    @song3 = Songs.new("You Raise Me Up")
    @songs = [@song1, @song2, @song3]

    @room1 = Rooms.new("Pop", 3, @songs)
    @room2 = Rooms.new("Classics", 2, @songs)
    @rooms = [@room1, @room2]

    @bar1 = Bar.new("Rubber Ducky", @rooms, 300, 10)
  end

  def test_get_bar_name
    assert_equal("Rubber Ducky", @bar1.name)
  end
  
  def test_get_age
    assert_equal(2, @bar1.room_list.count)
  end

  def test_get_till_total
    assert_equal(300, @bar1.till_total)
  end

  def test_get_entry_fee
    assert_equal(10, @bar1.entry_fee)
  end

end
