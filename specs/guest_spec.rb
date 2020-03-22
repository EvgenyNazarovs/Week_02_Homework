require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../guest')
require_relative('../song')
require_relative('../bar')

class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Rob", 50.0, "Space Oddity")
    @guest2 = Guest.new("Caspar", 35.0, "All My Friends")
    @guest3 = Guest.new("Tom", 25.0, "West End Girls")

    @naughties_room = Room.new("Naughties Room", 20, 2.0)

    @all_my_friends = Song.new("All My Friends", "LCD Soundsystem")
    @how_soon_is_now = Song.new("How Soon Is Now", "The Smiths")
  end

  def test_favourite_song
    assert_equal("Space Oddity", @guest1.favourite_song)
  end

  def test_guest_cheering_if_find_favourite_song
    @naughties_room.add_song_to_room(@all_my_friends)
    @naughties_room.add_song_to_room(@how_soon_is_now)
    assert_equal("Whoo!", @guest2.cheer_to_favourite_song(@naughties_room))
  end

end
