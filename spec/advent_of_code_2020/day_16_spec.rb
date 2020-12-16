# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day16 do
  let(:day16) { described_class.new(input) }

  describe 'part_one' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_16.txt' }

      it 'returns the ticket error rate' do
        expect(day16.part_one).to eq(71)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_16.txt' }

      it 'returns the ticket error rate' do
        expect(day16.part_one).to eq(28_873)
      end
    end
  end

  describe 'part_two' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_16_part_2.txt' }

      it 'returns the product of the values that start with \'departure\'' do
        expect(day16.part_two).to eq(132)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_16.txt' }

      it 'returns the product of the values that start with \'departure\'' do
        expect(day16.part_two).to eq(2_587_271_823_407)
      end
    end
  end
end
