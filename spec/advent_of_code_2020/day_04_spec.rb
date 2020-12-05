# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day04 do
  let(:day_four) { described_class.new(input) }

  describe 'part_one' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_04.txt' }

      it 'returns the number valid passports' do
        expect(day_four.part_one).to eq(2)
      end
    end

    context 'with test input' do
      let(:input) { 'input/day_04.txt' }

      it 'returns the number of valid passports' do
        expect(day_four.part_one).to eq(210)
      end
    end
  end

  describe 'part_two' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_04_strict.txt' }

      it 'returns the number valid passports' do
        expect(day_four.part_two).to eq(4)
      end
    end

    context 'with test input' do
      let(:input) { 'input/day_04.txt' }

      it 'returns the product of the number of trees for all the slopes' do
        expect(day_four.part_two).to eq(131)
      end
    end
  end
end
