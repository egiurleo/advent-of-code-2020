# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day22::Deck do
  let(:deck) { described_class.new(5, 4, 7, 9) }

  describe '#draw_card' do
    it 'removes the top card and returns it' do
      expect(deck.draw_card).to eq(5)
      expect(deck.cards).to eq([4, 7, 9])
    end
  end

  describe '#add_cards' do
    it 'adds cards to the bottom of the deck' do
      deck.add_cards(3, 6)
      expect(deck.cards).to eq([5, 4, 7, 9, 3, 6])
    end
  end

  describe '#empty?' do
    it 'returns true when the deck is empty' do
      expect(described_class.new.empty?).to be true
    end

    it 'returns false when the deck is not empty' do
      expect(deck.empty?).to be false
    end
  end

  describe '#score' do
    it { expect(deck.score).to eq(55) }
  end
end
