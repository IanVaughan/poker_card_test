require 'rspec/core'
require './lib/hand'

describe Hand do
  subject { described_class.new(cards) }
  let(:cards) { [Card.new('2', 'C'), Card.new('3', 'C')] }

  describe "accepts an array of cards" do
    it { should be_true }
  end

  context "same suit" do
    let(:cards) { [Card.new('2', 'C'), Card.new('3', 'C')] }

    it "detects if they are of the same suit" do
      subject.same_suit?.should be_true
    end
  end

  context "not same suit" do
    let(:cards) { [Card.new('2', 'H'), Card.new('3', 'C')] }

    it "detects if they are of the same suit" do
      subject.same_suit?.should be_false
    end
  end
end
