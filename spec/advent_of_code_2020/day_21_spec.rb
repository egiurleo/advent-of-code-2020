# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day21 do
  let(:day21) { described_class.new(input) }

  describe 'part_one' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_21.txt' }

      it 'returns the number of valid messages' do
        expect(day21.part_one).to eq(5)
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_21.txt' }

      it 'returns the number of valid messages' do
        expect(day21.part_one).to eq(2573)
      end
    end
  end

  describe 'part_two' do
    context 'with test input' do
      let(:input) { 'spec/mock_data/day_21.txt' }

      it 'returns the number of valid messages' do
        expect(day21.part_two).to eq('mxmxvkd,sqjhc,fvjkl')
      end
    end

    context 'with actual input' do
      let(:input) { 'input/day_21.txt' }

      it 'returns the number of valid messages' do
        expect(day21.part_two).to eq('bjpkhx,nsnqf,snhph,zmfqpn,qrbnjtj,dbhfd,thn,sthnsg')
      end
    end
  end
end
