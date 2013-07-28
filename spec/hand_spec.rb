require 'rspec/core'
require './lib/hand'

describe Hand do
  subject { described_class.new(cards) }
  let(:cards) { [Card.new('2', 'C'), Card.new('3', 'C')] }

  describe "accepts an array of cards" do
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
end
