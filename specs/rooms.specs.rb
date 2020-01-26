require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../rooms')
require_relative('../songs')
require_relative('../guest')
require_relative('../bar')

class RoomsTest < Minitest::Test

  def setup
    @song1 = Songs.new("99 Problems")
    @song2 = Songs.new("Hey Jude")
    @song3 = Songs.new("You Raise Me Up")
    @songs = [@song1, @song2, @song3]

    @new_song = Songs.new("Purple Rain")

    @guest1 = Guest.new("Fraser", 18, 50, "Stop Right Now")
    @guest2 = Guest.new("Luke", 23, 150, "Hey Jude")
    @guest3 = Guest.new("Graham", 23, 150, "99 Problems")
    @guests = [@guest1, @guest2, @guest3]

    @bar1 = Bar.new("Rubber Ducky", @room1, 300, 10)
    @room1 = Rooms.new("Pop", @songs, 2)

  end

  def test_get_room_name
    assert_equal("Pop", @room1.name)
  end

  def test_total_guests_in_room
    assert_equal(0, @room1.total_guests_in_room)
  end

  def test_get_songs_in_room
    assert_equal(3, @room1.songs_in_room.count)
  end

  def test_add_guest_to_room
    @room1.add_guest_to_room(@guest1)
    assert_equal(1, @room1.total_guests_in_room)
  end

  def test_add_group_of_guests
    @room1.add_group_of_guests(@guests)
    assert_equal(3, @room1.total_guests_in_room)
  end

  def test_remove_guest_to_room
    @guest1 = Guest.new("Fraser", 18, 50, "Stop Right Now")
    @room2 = Rooms.new("Pop", @songs, 2)
    @room2.add_guest_to_room(@guest1)
    @room2.remove_guest_from_room(@guest1)
    assert_equal(0, @room2.total_guests_in_room)
  end

  def test_add_song_to_room
    @room1.add_song_to_room(@new_song)
    assert_equal(4, @room1.songs_in_room.count)
  end

  def test_check_room_capacity
    assert_equal(2, @room1.check_room_capacity)
  end

  def test_stop_too_many_guests_enter_a_room
    @room1.add_guest_to_room(@guest1)
    @room1.add_guest_to_room(@guest2)
    @room1.add_guest_to_room(@guest3)
    assert_equal("ROOM FULL", @room1.capacity_of_room)
  end

  def test_space_still_available_in_room
    @room1.add_guest_to_room(@guest1)
    assert_equal("YOU CAN SING HERE", @room1.capacity_of_room)
  end

  def test_guests_favourite_song_in_room
    @room1.add_guest_to_room(@guest2)
    assert_equal("YES!", @room1.fav_song_in_room(@guest2))
  end

  def test_if_fav_song_not_in_room
    @room1.add_guest_to_room(@guest1)
    assert_equal("OH MAN! I want to sing my favourite song", @room1.fav_song_in_room(@guest1))

  end

end
