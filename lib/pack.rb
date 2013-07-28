class Pack
  include Enumerable

  attr_reader :cards

  # clubs, diamonds, hearts, spades
  SUITS = %w{C D H S}
  VALUES = %w{2 3 4 5 6 7 8 9 T J Q K A}

  def initialize
    @cards = []
    SUITS.each do |suit|
      VALUES.each { |value| @cards << "#{value}#{suit}" }
    end
  end

  def count
    @cards.count
  end
end
