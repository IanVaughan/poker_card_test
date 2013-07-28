require 'card'

class Hand
  def initialize cards
    @cards = cards
  end

  def same_suit?
    @cards.all? { |s| s.suit == @cards.first.suit }
  end
end
