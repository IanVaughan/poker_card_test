require 'spec_helper'
require './lib/pack'

describe Pack do
  let(:pack) { described_class.new }
  subject(:dealt) { pack.cards }

  context "setup" do
    it "starts of with 52 cards" do
      dealt.count.should == 52
    end

    it "has an array of cards" do
      dealt.should be_an_instance_of(Array)
    end

    it "has unique cards" do
      dealt.uniq!.should be_nil
    end

    it "has cards as I expect" do
      dealt[0].to_s.should == '2C'
      dealt[1].to_s.should == '3C'
    end
  end

  context "dealing cards" do
    # A poker hand consists of 5 cards dealt from the deck.
    # so, just dealing with 5 card deal atm
    # also have not dealt with returning cards to the pack yet!
    let(:hand) { pack.deal(5) }

    it "gives a random card from the pack" do
      hand.should be_an_instance_of(Hand)
      hand.cards.count.should == 5
    end

    it "has 5 less cards in the pack" do
      hand
      dealt.count.should == (52 - 5)
    end

    it "should have unique cards in the dealt hand" do
      hand.cards.uniq!.should be_nil
    end

    it "should not have the dealt cards in the pack" do
      (dealt + hand.cards).uniq!.should be_nil
    end

    it "should deal multiple hands" do
      [pack.deal(5), pack.deal(5), pack.deal(5)]
      dealt.count.should == 52 - 15
      pack.instance_variable_get(:@dealt).count.should == 15
    end

    it "cannot deal more cards than are in the pack" do
      # Could raise or return how many are left, depends whats best later on really.
      # bit bad as its not using the let :hand defined above
      pack.deal(55).should be_nil
      dealt.count.should == 52
    end
  end
end

