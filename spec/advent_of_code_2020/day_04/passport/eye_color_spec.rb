# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day04::Passport::EyeColor do
  let(:eye_color) { described_class.new(color) }

  describe '#valid?' do
    context 'strict: true' do
      context 'when color is amb' do
        let(:color) { 'amb' }

        it 'returns true' do
          expect(eye_color.valid?(strict: true)).to be true
        end
      end

      context 'when color is blu' do
        let(:color) { 'blu' }

        it 'returns true' do
          expect(eye_color.valid?(strict: true)).to be true
        end
      end

      context 'when color is brn' do
        let(:color) { 'brn' }

        it 'returns true' do
          expect(eye_color.valid?(strict: true)).to be true
        end
      end

      context 'when color is gry' do
        let(:color) { 'gry' }

        it 'returns true' do
          expect(eye_color.valid?(strict: true)).to be true
        end
      end

      context 'when color is grn' do
        let(:color) { 'grn' }

        it 'returns true' do
          expect(eye_color.valid?(strict: true)).to be true
        end
      end

      context 'when color is hzl' do
        let(:color) { 'hzl' }

        it 'returns true' do
          expect(eye_color.valid?(strict: true)).to be true
        end
      end

      context 'when color is oth' do
        let(:color) { 'oth' }

        it 'returns true' do
          expect(eye_color.valid?(strict: true)).to be true
        end
      end

      context 'when color is nil' do
        let(:color) { nil }

        it 'returns false' do
          expect(eye_color.valid?(strict: true)).to be false
        end
      end

      context 'when color is a random string' do
        let(:color) { 'purple' }

        it 'returns false' do
          expect(eye_color.valid?(strict: true)).to be false
        end
      end
    end

    context 'strict: false' do
      context 'when color is present' do
        let(:color) { 'purple' }

        it 'returns true' do
          expect(eye_color).to be_valid
        end
      end

      context 'when color is nil' do
        let(:color) { nil }

        it 'returns true' do
          expect(eye_color).not_to be_valid
        end
      end
    end
  end
end
