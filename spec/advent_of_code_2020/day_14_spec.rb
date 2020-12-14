# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day14 do
  let(:day14) { described_class.new(input) }

  describe 'part_one' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_14.txt' }

      it 'returns the sum of the values in memory' do
        expect(day14.part_one).to eq(165)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_14.txt' }

      it 'returns the sum of the values in memory' do
        expect(day14.part_one).to eq(9_879_607_673_316)
      end
    end
  end

  describe 'part_two' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_14_part_2.txt' }

      it 'returns the sum of the values in memory' do
        expect(day14.part_two).to eq(208)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_14.txt' }

      it 'returns the sum of the values in memory' do
        expect(day14.part_two).to eq(3_435_342_392_262)
      end
    end
  end
end
