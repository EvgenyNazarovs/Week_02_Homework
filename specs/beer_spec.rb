require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bar')
require_relative('../drink')
require_relative('../beer')

class BeerTest < MiniTest::Test

  def test_can_create_room
    ipa = Beer.new("IPA", 7.0, 5.0)
    assert_equal(Beer, ipa.class)
  end

end
