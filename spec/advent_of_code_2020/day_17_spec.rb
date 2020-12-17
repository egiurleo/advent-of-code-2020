# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day17 do
  let(:day17) { described_class.new(input) }

  describe 'part_one' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_17.txt' }

      it 'returns the number of active cubes' do
        expect(day17.part_one).to eq(112)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_17.txt' }

      it 'returns the number of active cubes' do
        expect(day17.part_one).to eq(353)
      end
    end
  end

  describe 'part_two' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_17.txt' }

      it 'returns the number of active cubes in a 4D grid' do
        expect(day17.part_two).to eq(848)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_17.txt' }

      it 'returns the number of active cubes in a 4D grid' do
        expect(day17.part_two).to eq(2472)
      end
    end
  end
end
