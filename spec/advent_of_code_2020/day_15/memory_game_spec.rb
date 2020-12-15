# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day15::MemoryGame do
  let(:game) { described_class.new([0, 3, 6]) }

  describe '#turn' do
    it 'returns the number spoken on that turn' do
      expect(game.turn).to eq(0)
    end

    it 'returns the number spoken on that turn' do
      game.turn

      expect(game.turn).to eq(3)
    end

    it 'returns the number spoken on that turn' do
      2.times do
        game.turn
      end

      expect(game.turn).to eq(6)
    end

    it 'returns the number spoken on that turn' do
      3.times do
        game.turn
      end

      expect(game.turn).to eq(0)
    end

    it 'returns the number spoken on that turn' do
      4.times do
        game.turn
      end

      expect(game.turn).to eq(3)
    end
  end
end
