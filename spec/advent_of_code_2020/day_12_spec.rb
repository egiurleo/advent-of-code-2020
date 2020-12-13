# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day12 do
  let(:day12) { described_class.new(input) }

  describe 'part_one' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_12.txt' }

      it 'returns the manhattan distance' do
        expect(day12.part_one).to eq(25)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_12.txt' }

      it 'returns the manhattan distance' do
        expect(day12.part_one).to eq(1496)
      end
    end
  end

  describe 'part_two' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_12.txt' }

      it 'returns the manhattan distance' do
        expect(day12.part_two).to eq(286)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_12.txt' }

      it 'returns the manhattan distance' do
        expect(day12.part_two).to eq(63_843)
      end
    end
  end
end
