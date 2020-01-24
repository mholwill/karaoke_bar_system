require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../rooms')
require_relative('../songs')

class RoomsTest < Minitest::Test

  def setup
    @song1 = Songs.new("99 Problems")
    @song2 = Songs.new("Hey Jude")
    @song3 = Songs.new("You Raise Me Up")
    @songs = [@song1, @song2, @song3]
    @room1 = Rooms.new("Pop", 3, @songs)

  end

  def test_get_room_name
    assert_equal("Pop", @room1.name)
  end

  def test_get_max_capacity
    assert_equal(3, @room1.capacity)
  end

  def test_get_songs_in_room
    assert_equal(3, @room1.songs_in_room.count)
  end

end
