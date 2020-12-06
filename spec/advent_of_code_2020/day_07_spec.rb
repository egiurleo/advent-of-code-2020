# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day07 do
  let(:day07) { described_class.new(input) }

  describe 'part_one' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_07.txt' }

      it 'returns the number of bags' do
        expect(day07.part_one).to eq(4)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_07.txt' }

      it 'returns the number of bags' do
        expect(day07.part_one).to eq(246)
      end
    end
  end

  describe 'part_two' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_07.txt' }

      it 'returns the number of bags' do
        expect(day07.part_two).to eq(32)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_07.txt' }

      it 'returns the number of bags' do
        expect(day07.part_two).to eq(2976)
      end
    end
  end
end
