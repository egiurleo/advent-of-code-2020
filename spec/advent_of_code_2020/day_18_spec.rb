# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day18 do
  let(:day18) { described_class.new(input) }

  describe 'part_one' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_18.txt' }

      it 'returns the sum of the value of the expressions' do
        expect(day18.part_one).to eq(26_457)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_18.txt' }

      it 'returns the sum of the value of the expressions' do
        expect(day18.part_one).to eq(12_918_250_417_632)
      end
    end
  end

  describe 'part_two' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_18.txt' }

      it 'returns the number of active cubes in a 4D grid' do
        expect(day18.part_two).to eq(848)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_18.txt' }

      it 'returns the number of active cubes in a 4D grid' do
        expect(day18.part_two).to eq(2472)
      end
    end
  end
end
