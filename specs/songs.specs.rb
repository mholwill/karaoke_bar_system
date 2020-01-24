require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../songs')

class SongsTest < Minitest::Test

  def setup
    @song1 = Songs.new("Hey Jude")
  end

  def test_get_song_name
    assert_equal("Hey Jude", @song1.name)
  end

end
