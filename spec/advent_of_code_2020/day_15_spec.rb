# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day15 do
  let(:day15) { described_class.new(input) }

  describe 'part_one' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_15.txt' }

      it 'returns the 2020th number' do
        expect(day15.part_one).to eq(436)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_15.txt' }

      it 'returns the 2020th number' do
        expect(day15.part_one).to eq(1015)
      end
    end
  end

  describe 'part_two' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_15.txt' }

      it 'returns the 30_000_000th number' do
        expect(day15.part_two).to eq(175_594)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_15.txt' }

      it 'returns the 30_000_000th number' do
        expect(day15.part_two).to eq(201)
      end
    end
  end
end
