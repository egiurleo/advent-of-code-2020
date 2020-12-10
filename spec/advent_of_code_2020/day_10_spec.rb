# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day10 do
  let(:day10) { described_class.new(input) }

  describe 'part_one' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_10.txt' }

      it 'returns the number of 1 jolt edges times number of 3 jolt edges' do
        expect(day10.part_one).to eq(35)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_10.txt' }

      it 'returns the number of 1 jolt edges times number of 3 jolt edges' do
        expect(day10.part_one).to eq(2112)
      end
    end
  end

  describe 'part_two' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_10.txt' }

      it 'returns the number of arrangements' do
        expect(day10.part_two).to eq(8)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_10.txt' }

      it 'returns the number of arrangements' do
        expect(day10.part_two).to eq(3_022_415_986_688)
      end
    end
  end
end
