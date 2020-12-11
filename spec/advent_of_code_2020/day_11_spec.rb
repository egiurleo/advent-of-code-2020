# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day11 do
  let(:day11) { described_class.new(input) }

  describe 'part_one' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_11.txt' }

      it 'returns the number of seats occupied once the system stabilizes' do
        expect(day11.part_one).to eq(37)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_11.txt' }

      it 'returns the number of seats occupied once the system stabilizes' do
        expect(day11.part_one).to eq(2152)
      end
    end
  end

  describe 'part_two' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_11.txt' }

      it 'returns the number of seats occupied once the system stabilizes' do
        expect(day11.part_two).to eq(26)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_11.txt' }

      it 'returns the number of seats occupied once the system stabilizes' do
        expect(day11.part_two).to eq(1937)
      end
    end
  end
end
