# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day04::Passport::HairColor do
  let(:hair_color) { described_class.new(color) }

  describe '#valid?' do
    context 'strict: true' do
      context 'when color is too long' do
        let(:color) { '#afd5678' }

        it 'returns false' do
          expect(hair_color.valid?(strict: true)).to be false
        end
      end

      context 'when color contains invalid characters' do
        let(:color) { '#abx123' }

        it 'returns false' do
          expect(hair_color.valid?(strict: true)).to be false
        end
      end

      context 'when color is valid' do
        let(:color) { '#ab4ef6' }

        it 'returns true' do
          expect(hair_color.valid?(strict: true)).to be true
        end
      end

      context 'when color is nil' do
        let(:color) { nil }

        it 'returns false' do
          expect(hair_color.valid?(strict: true)).to be false
        end
      end
    end

    context 'strict: false' do
      context 'when color is present' do
        let(:color) { 'purple' }

        it 'returns true' do
          expect(hair_color).to be_valid
        end
      end

      context 'when color is nil' do
        let(:color) { nil }

        it 'returns true' do
          expect(hair_color).not_to be_valid
        end
      end
    end
  end
end
