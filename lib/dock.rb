class Dock
  attr_reader :name, :max_rental_time, :rental_log

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
  end

  def rent(boat, renter)
    rental_log[boat] = renter
  end

  def charge(boat)
    {
      card_number: rental_log[boat].credit_card_number,
      amount: rental_amount(boat),
    }
  end

  def rental_amount(boat)
    if boat.hours_rented >= max_rental_time
      return max_rental_time * boat.price_per_hour
    else
      boat.hours_rented * boat.price_per_hour
    end
  end

  def return(boat)

  end

end
