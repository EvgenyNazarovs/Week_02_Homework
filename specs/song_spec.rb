require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../guest')
require_relative('../song')
require_relative('../bar')

class SongTest < MiniTest::Test

  def setup
    @all_my_friends = Song.new("All My Friends", "LCD Soundsystem")
  end

  def test_song_name
    assert_equal("LCD Soundsystem", @all_my_friends.artist)
  end



end
