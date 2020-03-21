require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../guest')
require_relative('../song')

class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Rob", 50.0, "Space Oddity")
    @guest2 = Guest.new("Caspar", 35.0, "All My Friends")
    @guest3 = Guest.new("Tom", 25.0, "West End Girls")
  end

  def test_favourite_song
    assert_equal("Space Oddity", @guest1.favourite_song)
  end



end
