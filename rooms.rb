class Rooms

  attr_reader :name, :songs_in_room, :capacity

  def initialize(name, songs_in_room, capacity)
    @name = name
    @songs_in_room = songs_in_room
    @capacity = capacity
    @guests = []
  end

  def guests_in_room
    return @guests.length
  end

  def add_guest_to_room(guest)
    @guests.push(guest)
  end

  def remove_guest_from_room(guest)
    @guests.delete(guest)
  end

  def add_song_to_room(new_song)
    @songs_in_room.push(new_song)
  end

  ###add group
  # guest_group
  # for guest in guests
  #   room.add_guest_to_room(guest)
  # end
  #





end
