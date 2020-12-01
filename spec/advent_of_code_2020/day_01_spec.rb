# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day01 do
  let(:day_one) { described_class.new(input) }

  describe 'part_one' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_01.txt' }

      it 'returns the product of the numbers that sum to 2020' do
        expect(day_one.part_one).to eq(514_579)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_01.txt' }

      it 'returns the product of the numbers that sum to 2020' do
        expect(day_one.part_one).to eq(928_896)
      end
    end
  end

  describe 'part_two' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_01.txt' }

      it 'returns the product of the 3 numbers that sum to 2020' do
        expect(day_one.part_two).to eq(241_861_950)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_01.txt' }

      it 'returns the product of the 3 numbers that sum to 2020' do
        expect(day_one.part_two).to eq(295_668_576)
      end
    end
  end
end
