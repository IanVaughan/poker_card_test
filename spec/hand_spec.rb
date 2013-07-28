require 'spec_helper'
require './lib/hand'
require './lib/pack'

describe Hand do
  subject(:hand) { described_class.new(cards) }

  describe "accepts an array of cards" do
    let(:cards) { [Card.new('2', 'C'), Card.new('3', 'C')] }
    it { should be_true }
  end

  describe '#same_suit?' do
    context "when they are the same suit" do
      let(:cards) { [Card.new('2', 'C'), Card.new('3', 'C')] }

      it "returns true" do
        subject.same_suit?.should be_true
      end
    end

    context "when they are not tje same suit" do
      let(:cards) { [Card.new('2', 'H'), Card.new('3', 'C')] }

      it "returns false" do
        subject.same_suit?.should be_false
      end
    end
  end

  describe '#sort' do
  end

  describe '#sequential?' do
    context 'when the cards are sequential in number' do
      context 'simple case' do
        let(:cards) { [Card.new('3', 'H'), Card.new('2', 'C')] }

        it 'returns true' do
          subject.sequential?.should be_true
        end
      end

      context 'high value case' do
        let(:cards) { [Card.new('Q', 'H'), Card.new('J', 'C')] }

        it 'returns true' do
          subject.sequential?.should be_true
        end
      end

      context 'many values case' do
        let(:cards) { [Card.new('Q', 'H'), Card.new('J', 'C'), Card.new('K', 'C')] }

        it 'returns true' do
          subject.sequential?.should be_true
        end
      end
    end

    context 'when the cards are not sequential in number' do
      let(:cards) { [Card.new('2', 'H'), Card.new('4', 'C')] }

      it 'returns false' do
        subject.sequential?.should be_false
      end
    end
  end

  #  let(:hand) { described_class.new(hand) }
  context "rules" do
    # 5 cards of the same suit with consecutive values. Ranked by the highest card in the hand.
    describe "finds a Straight flush" do
      subject { hand.straight_flush? }

      context "with a straight flush" do
        # could create a starting point and iterate over every combo
        # i.e 2C, 3C, 4C, 5C, 6C, then 3C, 4C, 5C, 6C, 7C, etc
        # Could also create helper methods to give a range and return a Hand
        let(:cards) { [Card.new('2', 'C'),
                      Card.new('3', 'C'),
                      Card.new('4', 'C'),
                      Card.new('5', 'C'),
                      Card.new('6', 'C')] }
        it { should be_true }
      end

      context "without a straight flush" do
        describe "mixed suit" do
          let(:cards) { [Card.new('2', 'C'),
                        Card.new('3', 'H'),
                        Card.new('4', 'S'),
                        Card.new('5', 'D'),
                        Card.new('6', 'C')] }
          it { should be_false }
        end

        describe "mixed values" do
          let(:cards) { [Card.new('2', 'C'),
                        Card.new('3', 'C'),
                        Card.new('6', 'C'),
                        Card.new('7', 'C'),
                        Card.new('8', 'C')] }
          it { should be_false }
        end
      end
    end

    # 4 cards with the same value. Ranked by the value of the 4 cards.
    describe "finds Four of a kind" do
      subject { hand.four_of_a_kind? }

      context "with Four of a kind" do
        let(:cards) { [Card.new('2', 'C'),
                      Card.new('2', 'D'),
                      Card.new('2', 'H'),
                      Card.new('2', 'S'),
                      Card.new('6', 'C')] }
        it { should be_true }
      end

      context "without Four of a kind" do
        let(:cards) { [Card.new('2', 'C'),
                      Card.new('3', 'D'),
                      Card.new('2', 'H'),
                      Card.new('2', 'S'),
                      Card.new('6', 'C')] }
        it { should be_false }
      end
    end

    it "finds Full House"
    it "finds Flush"
    it "finds Straight"
    it "finds Three of a Kind"
    it "finds Two Pairs"
    it "finds Pair"
    it "finds High Card"
  end

  context "finding a winning hand" do
    subject { hand.beats?(hand_b) }

    context 'with a straight_flush' do
      let(:cards) { straight_flush('3', 'C') }

      describe 'when other hand is not a straight flush' do
        let(:hand_b) { Hand.new([
                          Card.new('2', 'C'),
                          Card.new('3', 'C'),
                          Card.new('5', 'C'),
                          Card.new('8', 'S'),
                          Card.new('K', 'C')]) }
        it { should be_true }
      end

      describe 'when other hand is a higher straight flush' do
        let(:hand_b) { Hand.new(straight_flush('5', 'H')) }
        it { should be_false }
      end

      describe 'when other hand is a lower straight flush' do
        let(:hand_b) { Hand.new(straight_flush('2', 'H')) }
        it { should be_true }
      end
    end
  end
end
