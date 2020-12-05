# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day05 do
  let(:day_five) { described_class.new(input) }

  describe 'part_one' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_05.txt' }

      it 'returns the highest seat id' do
        expect(day_five.part_one).to eq(820)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_05.txt' }

      it 'returns the highest seat id' do
        expect(day_five.part_one).to eq(890)
      end
    end
  end

  describe 'part_two' do
    context 'with actual input' do
      let(:input) { 'input/day_05.txt' }

      it 'the seat id' do
        expect(day_five.part_two).to eq(651)
      end
    end
  end
end
