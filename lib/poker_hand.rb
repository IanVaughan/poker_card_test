require 'pack'

class PokerHand

  def initialize(hand)
    @hand = hand
  end

  def straight_flush?
    return false unless @hand.same_suit?
    return false unless @hand.sequential?
    true
  end

end
