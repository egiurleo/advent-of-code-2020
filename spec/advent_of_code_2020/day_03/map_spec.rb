# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day03::Map do
  let(:map_rows) do
    AdventOfCode2020::Utils.read_file('spec/mock_data/day_03.txt')
  end

  let(:map) { described_class.new(map_rows) }

  describe '#bottom?' do
    it 'returns false when input is 0' do
      expect(map.bottom?(0)).to be false
    end

    it 'returns false when input is within the map' do
      expect(map.bottom?(5)).to be false
    end

    it 'returns false when input is the edge of the map' do
      expect(map.bottom?(10)).to be false
    end

    it 'returns true when input is the length of the map' do
      expect(map.bottom?(11)).to be true
    end

    it 'returns true when input is greater than the length of the map' do
      expect(map.bottom?(100)).to be true
    end
  end

  describe '#tree?' do
    it 'returns nil when row is outside bounds of map' do
      expect(map.tree?(100, 1)).to be_nil
    end

    context 'when column is inside bounds of map' do
      it 'returns false when on a dot' do
        expect(map.tree?(2, 2)).to be false
      end

      it 'returns true when on a hash' do
        expect(map.tree?(2, 1)).to be true
      end
    end

    context 'when column is 1 map\'s-length outside of the map' do
      it 'returns false when on a dot' do
        expect(map.tree?(3, 14)).to be false
      end

      it 'returns true when on a hash' do
        expect(map.tree?(3, 15)).to be true
      end
    end

    context 'when column is 2 map\'s-length outside of the map' do
      it 'returns false when on a dot' do
        expect(map.tree?(6, 28)).to be false
      end

      it 'returns true when on a hash' do
        expect(map.tree?(6, 32)).to be true
      end
    end
  end
end
