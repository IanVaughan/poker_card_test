require 'spec_helper'
require './lib/poker_hand'
require './lib/pack'

describe PokerHand do
  let(:poker) { described_class.new(hand) }

  context "rules" do
    describe "finds a Straight flush" do
      subject { poker.straight_flush? }

      context "with a straight flush" do
        # could create a starting point and iterate over every combo
        # i.e 2C, 3C, 4C, 5C, 6C, then 3C, 4C, 5C, 6C, 7C, etc
        # Could also create helper methods to give a range and return a Hand
        let(:hand) { Hand.new([Card.new('2', 'C'),
                      Card.new('3', 'C'),
                      Card.new('4', 'C'),
                      Card.new('5', 'C'),
                      Card.new('6', 'C')]) }
        it { should be_true }
      end

      context "without a straight flush" do
        describe "mixed suit" do
          let(:hand) { Hand.new([Card.new('2', 'C'),
                        Card.new('3', 'H'),
                        Card.new('4', 'S'),
                        Card.new('5', 'D'),
                        Card.new('6', 'C')]) }
          it { should be_false }
        end

        describe "mixed values" do
          let(:hand) { Hand.new([Card.new('2', 'C'),
                        Card.new('3', 'C'),
                        Card.new('6', 'C'),
                        Card.new('7', 'C'),
                        Card.new('8', 'C')]) }
          it { should be_false }
        end
      end
    end

    it "finds Four of a kind"
    it "finds Full House"
    it "finds Flush"
    it "finds Straight"
    it "finds Three of a Kind"
    it "finds Two Pairs"
    it "finds Pair"
    it "finds High Card"
  end

end
