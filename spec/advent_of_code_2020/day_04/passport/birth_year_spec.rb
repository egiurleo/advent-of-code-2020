# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day04::Passport::BirthYear do
  let(:birth_year) { described_class.new(value) }

  describe '#valid?' do
    context 'strict: true' do
      context 'when value is too low' do
        let(:value) { '1919' }

        it 'returns false' do
          expect(birth_year.valid?(strict: true)).to be false
        end
      end

      context 'when value is to high' do
        let(:value) { '2003' }

        it 'returns false' do
          expect(birth_year.valid?(strict: true)).to be false
        end
      end

      context 'when value is valid' do
        let(:value) { '1990' }

        it 'returns true' do
          expect(birth_year.valid?(strict: true)).to be true
        end
      end

      context 'when value is nil' do
        let(:value) { nil }

        it 'returns false' do
          expect(birth_year.valid?(strict: true)).to be false
        end
      end
    end

    context 'strict: false' do
      context 'when value is present' do
        let(:value) { '2002' }

        it 'returns true' do
          expect(birth_year).to be_valid
        end
      end

      context 'when value is nil' do
        let(:value) { nil }

        it 'returns fa' do
          expect(birth_year).not_to be_valid
        end
      end
    end
  end
end
