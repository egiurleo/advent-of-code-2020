# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day08 do
  let(:day08) { described_class.new(input) }

  describe 'part_one' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_08.txt' }

      it 'returns the accumulator number' do
        expect(day08.part_one).to eq(5)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_08.txt' }

      it 'returns the accumulator number' do
        expect(day08.part_one).to eq(1766)
      end
    end
  end

  describe 'part_two' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_08.txt' }

      it 'returns the accumulator number' do
        expect(day08.part_two).to eq(8)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_08.txt' }

      it 'returns the accumulator number' do
        expect(day08.part_two).to eq(1639)
      end
    end
  end
end
