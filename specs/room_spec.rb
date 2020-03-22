require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../guest')
require_relative('../song')

class RoomTest < MiniTest::Test

  def setup
    @naughties_room = Room.new("Naughties Room", 20, 2.0)
    @eighties_room = Room.new("80's Room", 30, 2.0)
    @nineties_room = Room.new("90's Room", 15, 2.0)
    @bowie_room = Room.new("David Bowie Room", 50, 2.0)
    @exclusive_room = Room.new("Deluxe Suite", 4, 20.0)

    @west_end_girls = Song.new("West End Girls", "Pet Shop Boys")
    @how_soon_is_now = Song.new("How Soon Is Now", "The Smiths")
    @rhythm_of_the_night = Song.new("Rhythm of the Night", "Corona")

    @guest1 = Guest.new("Rob", 50.0, "Space Oddity")
    @guest2 = Guest.new("Caspar", 35.0, "All My Friends")
    @guest3 = Guest.new("Tom", 25.0, "West End Girls")
    @guest4 = Guest.new("Roger", 100.0, "Round and Round")

  end

  def test_can_create_room
    assert_equal(Room, @bowie_room.class)
  end

  def test_add_song_to_room
    @nineties_room.add_song_to_room(@rhythm_of_the_night)
    assert_equal([@rhythm_of_the_night], @nineties_room.playlist)
  end

  def test_current_number_of_occupiers
    assert_equal(0, @naughties_room.current_number_of_occupiers)
  end

  def test_add_guest_to_room_enough_space_enough_money
    @naughties_room.add_guest_to_room(@guest2)
    assert_equal([@guest2], @naughties_room.current_occupiers)
    assert_equal(1, @naughties_room.current_number_of_occupiers)
  end

  def test_add_guest_to_room_not_enough_space
    @exclusive_room.current_occupiers = [@guest1, @guest2, @guest3, @guest4]
    assert_equal("Not enough space in the room.", @exclusive_room.add_guest_to_room(@guest3))
    assert_equal(4, @exclusive_room.current_number_of_occupiers)
  end

  def test_guest_has_enough_money_to_join_room
    assert_equal(true, @exclusive_room.enough_money?(@guest4))
  end

  def test_check_money_and_add_guess_to_room
    @naughties_room.add_guest_to_room(@guest2)
    assert_equal([@guest2], @naughties_room.current_occupiers)
  end

  def test_room_has_enough_capacity
    @exclusive_room.current_occupiers = [@guest1]
    assert_equal(true, @exclusive_room.has_capacity?)
  end

  def test_check_money_room_has_capacity_and_add_guest_to_room
    @naughties_room.add_guest_to_room(@guest2)
    assert_equal([@guest2], @naughties_room.current_occupiers)
    assert_equal(33.0, @guest2.wallet)
  end

  def test_check_not_enough_money_doesnt_add_guest
    guest5 = Guest.new("Anthony", 5.0, "Suedehead")
    @exclusive_room.add_guest_to_room(guest5)
    assert_equal("Not enough money to enter the room.", @exclusive_room.add_guest_to_room(guest5))
  end

  end


# Extensions
# What happens if there are more guests trying to be
# checked in than there is free space in the room?
# Karaoke venues usually have an entry fee -
# So the guests could have money so they can pay it.
