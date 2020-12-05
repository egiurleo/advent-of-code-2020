# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day04::Passport::Height do
  let(:height) { described_class.new(value) }

  describe '#valid?' do
    context 'strict: true' do
      context 'when height has the wrong units' do
        let(:value) { '12ft' }

        it 'returns false' do
          expect(height.valid?(strict: true)).to be false
        end
      end

      context 'when height is too short in cm' do
        let(:value) { '149cm' }

        it 'returns false' do
          expect(height.valid?(strict: true)).to be false
        end
      end

      context 'when height is too tall in cm' do
        let(:value) { '194cm' }

        it 'returns false' do
          expect(height.valid?(strict: true)).to be false
        end
      end

      context 'when height is too short in in' do
        let(:value) { '58in' }

        it 'returns false' do
          expect(height.valid?(strict: true)).to be false
        end
      end

      context 'when height is too tall in in' do
        let(:value) { '77in' }

        it 'returns false' do
          expect(height.valid?(strict: true)).to be false
        end
      end

      context 'when height is correct in in' do
        let(:value) { '65in' }

        it 'returns true' do
          expect(height.valid?(strict: true)).to be true
        end
      end

      context 'when height is correct in cm' do
        let(:value) { '170cm' }

        it 'returns true' do
          expect(height.valid?(strict: true)).to be true
        end
      end
    end

    context 'strict: false' do
      context 'when height is present' do
        let(:value) { '2050' }

        it 'returns true' do
          expect(height).to be_valid
        end
      end

      context 'when height is nil' do
        let(:value) { nil }

        it 'returns false' do
          expect(height).not_to be_valid
        end
      end
    end
  end
end
