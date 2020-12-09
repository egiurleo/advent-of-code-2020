# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day09 do
  let(:day09) { described_class.new(input) }

  describe 'part_one' do
    context 'with actual input' do
      let(:input) { 'input/day_09.txt' }

      it 'returns the invalid number' do
        expect(day09.part_one).to eq(26_134_589)
      end
    end
  end

  describe 'part_two' do
    context 'with actual input' do
      let(:input) { 'input/day_09.txt' }

      it 'returns the sum of the first and last numbers of the range' do
        expect(day09.part_two).to eq(3_535_124)
      end
    end
  end
end
