# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day22::Game do
  let(:deck1) { AdventOfCode2020::Day22::Deck.new(9, 2, 6, 3, 1) }
  let(:deck2) { AdventOfCode2020::Day22::Deck.new(5, 8, 4, 7, 10) }
  let(:game) { described_class.new(deck1, deck2) }

  describe '#play' do
    it 'runs through the game and saves the winner' do
      game.play

      expect(game.finished?).to be true
      expect(game.winner).to eq(described_class::PLAYER_2)
      expect(game.winning_deck.cards).to eq([3, 2, 10, 6, 8, 5, 9, 4, 7, 1])
    end
  end
end
