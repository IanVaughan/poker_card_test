require 'card'
require 'hand'

class Pack

  attr_reader :cards

  # clubs, diamonds, hearts, spades
  SUITS = %w{C D H S}
  VALUES = %w{2 3 4 5 6 7 8 9 T J Q K A}

  def initialize
    @cards = []
    SUITS.each do |suit|
      VALUES.each { |value| @cards << Card.new(value, suit) }
    end
    @dealt = []
  end

  def count
    @cards.count
  end

  def deal(number)
    return if number > count
    @dealt = []
    number.times { @dealt << @cards.delete_at(rand(count)) }
    @dealt
  end
end
