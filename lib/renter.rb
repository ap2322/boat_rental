class Renter
  attr_reader :name, :credit_card_number

  def initialize(name, credit_card)
    @name = name
    @credit_card_number = credit_card
  end
end
