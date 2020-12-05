# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day05::NumberFinder do
  describe '.find_number' do
    let(:number) do
      described_class.find_number(
        min: 0,
        max: max,
        up_char: up_char,
        down_char: down_char,
        pattern: pattern
      )
    end

    context 'with 127 rows' do
      let(:max) { 127 }
      let(:up_char) { 'B' }
      let(:down_char) { 'F' }

      context 'FBFBBFF' do
        let(:pattern) { 'FBFBBFF' }

        it 'returns 44' do
          expect(number).to eq(44)
        end
      end

      context 'BFFFBBF' do
        let(:pattern) { 'BFFFBBF' }

        it 'returns 70' do
          expect(number).to eq(70)
        end
      end

      context 'FFFBBBF' do
        let(:pattern) { 'FFFBBBF' }

        it 'returns 14' do
          expect(number).to eq(14)
        end
      end

      context 'BBFFBBF' do
        let(:pattern) { 'BBFFBBF' }

        it 'returns 102' do
          expect(number).to eq(102)
        end
      end
    end

    context 'when 8 columns' do
      let(:max) { 7 }
      let(:up_char) { 'R' }
      let(:down_char) { 'L' }

      context 'RLR' do
        let(:pattern) { 'RLR' }

        it 'returns 5' do
          expect(number).to eq(5)
        end
      end

      context 'RRR' do
        let(:pattern) { 'RRR' }

        it 'returns 7' do
          expect(number).to eq(7)
        end
      end

      context 'RLL' do
        let(:pattern) { 'RLL' }

        it 'returns 4' do
          expect(number).to eq(4)
        end
      end
    end
  end

  describe '.find_missing_number' do
    context 'when number is missing from latter half of list' do
      let(:list) { [5, 6, 7, 8, 10] }

      it 'returns 9' do
        expect(described_class.find_missing_number(list)).to eq(9)
      end
    end

    context 'when number is missing from beginning half of list' do
      let(:list) { [5, 7, 8, 9, 10] }

      it 'returns 6' do
        expect(described_class.find_missing_number(list)).to eq(6)
      end
    end

    context 'when number is missing from even-length list' do
      let(:list) { [5, 6, 7, 9] }

      it 'returns 8' do
        expect(described_class.find_missing_number(list)).to eq(8)
      end
    end
  end
end
