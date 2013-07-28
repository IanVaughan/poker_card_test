require 'spec_helper'
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
end
