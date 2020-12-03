# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day03 do
  let(:day_three) { described_class.new(input) }

  describe 'part_one' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_03.txt' }

      it 'returns the number of trees' do
        expect(day_three.part_one).to eq(7)
      end
    end

    context 'with test input' do
      let(:input) { 'input/day_03.txt' }

      it 'returns the number of trees' do
        expect(day_three.part_one).to eq(205)
      end
    end
  end

  describe 'part_two' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_03.txt' }

      it 'returns the product of the number of trees for all the slopes' do
        expect(day_three.part_two).to eq(336)
      end
    end

    context 'with test input' do
      let(:input) { 'input/day_03.txt' }

      it 'returns the product of the number of trees for all the slopes' do
        expect(day_three.part_two).to eq(3_952_146_825)
      end
    end
  end
end
