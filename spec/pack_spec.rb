require 'rspec/core'
require './lib/pack'

describe Pack do
  subject { described_class.new }

  context "setup" do
    it "starts of with 52 cards" do
      subject.count.should == 52
    end

    it "has an array of cards" do
      subject.should be_an_instance_of(Array)
    end

    it "has unique cards" do
      subject.uniq!.should be_nil
    end

    it "has cards as I expect" do
      subject[0].should == '2C'
      subject[1].should == '3C'
    end
  end

  context "dealing cards" do
    # A poker hand consists of 5 cards dealt from the deck.
    # so, just dealing with 5 card deal atm
    let(:dealt) { subject.deal(5) }

    it "gives a random card from the pack" do
      dealt.should be_an_instance_of(Array)
      dealt.count.should == 5
    end

    it "has 5 less cards in the pack" do
      subject.count.should == 52 - 5
    end

    it "cannot deal more cards than are in the pack" do
      # Could raise or return how many are left, depends whats best later on really.
      subject.deal(55).should be_nil
      subject.count.should == 52 - 5
    end
  end
end

