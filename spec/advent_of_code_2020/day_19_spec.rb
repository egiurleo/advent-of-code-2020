# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day19 do
  let(:day19) { described_class.new(input) }

  describe 'part_one' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_19.txt' }

      it 'returns the number of valid messages' do
        expect(day19.part_one).to eq(2)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_19.txt' }

      it 'returns the number of valid messages' do
        expect(day19.part_one).to eq(111)
      end
    end
  end

  describe 'part_two' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_19_part_2.txt' }

      it 'returns the number of valid messages' do
        expect(day19.part_one).to eq(3)
        expect(day19.part_two(depth: 4)).to eq(12)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_19.txt' }

      it 'returns the number of valid messages' do
        expect(day19.part_two(depth: 11)).to eq(343)
      end
    end
  end
end
