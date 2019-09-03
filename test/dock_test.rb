require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/boat'
require './lib/dock'
require 'pry'

class DockTest < Minitest::Test
  def setup
    @dock = Dock.new("The Rowing Dock", 3)
    @kayak_1 = Boat.new(:kayak, 20)
    @kayak_2 = Boat.new(:kayak, 20)
    @sup_1 = Boat.new(:standup_paddle_board, 15)
    @patrick = Renter.new("Patrick Star", "4242424242424242")
    @eugene = Renter.new("Eugene Crabs", "1313131313131313")
  end

  def test_it_exists
    assert_instance_of Dock, @dock
  end

  def test_attributes_at_init
    expected = {}
    assert_equal "The Rowing Dock", @dock.name
    assert_equal 3, @dock.max_rental_time
    assert_equal expected, @dock.rental_log
  end

  def test_rent
    @dock.rent(@kayak_1, @patrick)
    expected_1 = {@kayak_1 => @patrick}

    assert_equal expected_1, @dock.rental_log

    @dock.rent(@kayak_2, @patrick)
    @dock.rent(@sup_1, @eugene)
    expected_2 = {
      @kayak_1 => @patrick,
      @kayak_2 => @patrick,
      @sup_1 => @eugene
    }

    assert_equal expected_2, @dock.rental_log
  end

  def test_charge
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.rent(@sup_1, @eugene)
    @kayak_1.add_hour
    @kayak_1.add_hour

    expected_1 = {card_number: "4242424242424242", amount: 40}

    assert_equal expected_1, @dock.charge(@kayak_1)

    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour
    expected_2 = {card_number: "1313131313131313", amount: 45 }

    assert_equal expected_2, @dock.charge(@sup_1)

  end

  def test_return

  end
end
