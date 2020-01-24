class Rooms

  attr_reader :name, :songs_in_room, :capacity

  def initialize(name, songs_in_room, capacity)
    @name = name
    @songs_in_room = songs_in_room
    @capacity = capacity
    @guests = []
  end

  def check_guests_in_room()
    return @guests.length
  end

  def add_guest_to_room(guest)
    @guests.push(guest)
  end

  def remove_guest_from_room(guest)
    @guests.delete(guest)
  end

  def add_group_of_guests(guests)
    for guest in guests
      add_guest_to_room(guests)
    end
  end

  def add_song_to_room(new_song)
    @songs_in_room.push(new_song)
  end

  def check_room_capacity()
    return @capacity
  end

  def capacity_of_room()
      for guest in @guests
        if check_guests_in_room() > @capacity
          return "ROOM FULL"
        else
          return "YOU CAN SING HERE"
        end
      end
  end


end
