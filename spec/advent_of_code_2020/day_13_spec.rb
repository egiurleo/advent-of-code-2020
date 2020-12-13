# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day13 do
  let(:day13) { described_class.new(input) }

  describe 'part_one' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_13.txt' }

      it 'product of the bus id and the waiting time' do
        expect(day13.part_one).to eq(295)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_13.txt' }

      it 'product of the bus id and the waiting time' do
        expect(day13.part_one).to eq(4938)
      end
    end
  end

  describe 'part_two' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_13.txt' }

      it 'returns the earliest timestamp' do
        expect(day13.part_two).to eq(1_068_781)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_13.txt' }

      it 'returns the earliest timestamp' do
        expect(day13.part_two).to eq(230_903_629_977_901)
      end
    end
  end
end
