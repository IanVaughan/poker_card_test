#require 'card'
#require 'hand_sort'
require 'rubycards'

class Pack
  include RubyCards

  def initialize
    @hand = Hand.new
    @deck = Deck.new
    @deck.shuffle!
  end

  def deal(number)
    @hand.draw(deck, number)
    puts @hand
  end
end
