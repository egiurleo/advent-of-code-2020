# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day04::Passport::Pid do
  let(:pid) { described_class.new(value) }

  describe '#valid?' do
    context 'strict: true' do
      context 'when pid is too long' do
        let(:value) { '1111111111' }

        it 'returns false' do
          expect(pid.valid?(strict: true)).to be false
        end
      end

      context 'when pid is too short' do
        let(:value) { '11111111' }

        it 'returns false' do
          expect(pid.valid?(strict: true)).to be false
        end
      end

      context 'when pid has invalid characters' do
        let(:value) { '12345678x' }

        it 'returns false' do
          expect(pid.valid?(strict: true)).to be false
        end
      end

      context 'when pid is correct' do
        let(:value) { '145982734' }

        it 'returns true' do
          expect(pid.valid?(strict: true)).to be true
        end
      end

      context 'when pid is nil' do
        let(:value) { nil }

        it 'returns false' do
          expect(pid.valid?(strict: true)).to be false
        end
      end
    end

    context 'strict: false' do
      context 'when pid is present' do
        let(:value) { 'purple' }

        it 'returns true' do
          expect(pid).to be_valid
        end
      end

      context 'when pid is nil' do
        let(:value) { nil }

        it 'returns true' do
          expect(pid).not_to be_valid
        end
      end
    end
  end
end
