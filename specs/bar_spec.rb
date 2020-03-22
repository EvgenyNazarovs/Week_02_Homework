require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../guest')
require_relative('../song')
require_relative('../bar')
require_relative('../beer')
require_relative('../vodka')

class BarTest < MiniTest::Test

def setup

  @nineties_room = Room.new("90's Room", 15, 2.0)
  @bowie_room = Room.new("David Bowie Room", 50, 2.0)
  @exclusive_room = Room.new("Deluxe Suite", 4, 20.0)

  @rooms = [@nineties_room, @bowie_room, @exclusive_room]

  @vodka = Vodka.new("Vodka", 40.0, 5.5)
  @beer = Beer.new("House Beer", 5.0, 4.5)

  @bar = Bar.new(@drinks, @rooms)

  @guest1 = Guest.new("Rob", 50.0, "Space Oddity")
  @guest2 = Guest.new("Caspar", 35.0, "All My Friends")

end

def test_sell_item
  @bar.sell_item(@guest2, @vodka, @nineties_room)
  assert_equal({"Caspar" => 5.5}, @nineties_room.bar_tab)
  assert_equal(1, @bar.drinks_sold)
end

end
