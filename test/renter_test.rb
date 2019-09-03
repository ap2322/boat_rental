require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/boat'

class RenterTest < Minitest::Test
  def setup
    @renter = Renter.new("Patrick Star", "4242424242424242")
  end

  def test_it_exists
    assert_instance_of Renter, @renter
  end

  def test_attributes_at_init
    assert_equal "Patrick Star", @renter.name
    assert_equal "4242424242424242", @renter.credit_card_number

  end
end
