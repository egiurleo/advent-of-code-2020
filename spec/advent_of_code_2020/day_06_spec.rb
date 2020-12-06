# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day06 do
  let(:day06) { described_class.new(input) }

  describe 'part_one' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_06.txt' }

      it 'returns number of questions answered' do
        expect(day06.part_one).to eq(11)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_06.txt' }

      it 'returns the number of questions answered' do
        expect(day06.part_one).to eq(6297)
      end
    end
  end

  describe 'part_two' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_06.txt' }

      it 'returns the total number of questions everybody in the groups answered' do
        expect(day06.part_two).to eq(6)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_06.txt' }

      it 'returns the total number of questions everybody in the groups answered' do
        expect(day06.part_two).to eq(3158)
      end
    end
  end
end
