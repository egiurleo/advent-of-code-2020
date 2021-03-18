# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day22 do
  let(:day22) { described_class.new(input) }

  describe 'part_one' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_22.txt' }

      it 'returns the number of valid messages' do
        expect(day22.part_one).to eq(306)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_22.txt' }

      it 'returns the number of valid messages' do
        expect(day22.part_one).to eq(33_694)
      end
    end
  end

  describe 'part_two' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_22.txt' }

      it 'returns the number of valid messages' do
        expect(day22.part_two).to eq(291)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_22.txt' }

      it 'returns the number of valid messages' do
        expect(day22.part_two).to eq(31_835)
      end
    end
  end
end
