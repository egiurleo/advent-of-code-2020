# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day02 do
  let(:day_two) { described_class.new(input) }

  describe 'part_one' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_02.txt' }

      it 'returns number of valid passwords' do
        expect(day_two.part_one).to eq(2)
      end
    end

    context 'with test input' do
      let(:input) { 'input/day_02.txt' }

      it 'returns number of valid passwords' do
        expect(day_two.part_one).to eq(572)
      end
    end
  end

  describe 'part_two' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_02.txt' }

      it 'returns number of valid passwords' do
        expect(day_two.part_two).to eq(1)
      end
    end

    context 'with test input' do
      let(:input) { 'input/day_02.txt' }

      it 'returns number of valid passwords' do
        expect(day_two.part_two).to eq(306)
      end
    end
  end
end
