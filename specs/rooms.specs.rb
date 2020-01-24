require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../rooms')

class RoomsTest < Minitest::Test

  def setup
    @song1 = Songs.new("99 Problems")
    @song2 = Songs.new("Hey Jude")
    @song3 = Songs.new("You Raise Me Up")
    @songs = [@song1, @song2, @song3]
    @room1 = Rooms.new("Pop", 3, @songs)

  end

end
