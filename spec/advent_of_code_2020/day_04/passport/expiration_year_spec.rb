# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day04::Passport::ExpirationYear do
  let(:eyr) { described_class.new(value) }

  describe '#valid?' do
    context 'strict: true' do
      context 'when eyr is too low' do
        let(:value) { '2019' }

        it 'returns false' do
          expect(eyr.valid?(strict: true)).to be false
        end
      end

      context 'when eyr is too high' do
        let(:value) { '2031' }

        it 'returns false' do
          expect(eyr.valid?(strict: true)).to be false
        end
      end

      context 'when eyr is nil' do
        let(:value) { nil }

        it 'returns false' do
          expect(eyr.valid?(strict: true)).to be false
        end
      end

      context 'when eyr is correct' do
        let(:value) { '2025' }

        it 'returns true' do
          expect(eyr.valid?(strict: true)).to be true
        end
      end
    end

    context 'strict: false' do
      context 'when eyr is present' do
        let(:value) { '2050' }

        it 'returns true' do
          expect(eyr).to be_valid
        end
      end

      context 'when eyr is nil' do
        let(:value) { nil }

        it 'returns true' do
          expect(eyr).not_to be_valid
        end
      end
    end
  end
end
