# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day04::Passport::Cid do
  let(:cid) { described_class.new(value) }

  describe '#valid?' do
    context 'strict: true' do
      context 'when cid is nil' do
        let(:value) { nil }

        it 'returns true' do
          expect(cid.valid?(strict: true)).to be true
        end
      end

      context 'when cid is not nil' do
        let(:value) { 'hello' }

        it 'returns true' do
          expect(cid.valid?(strict: true)).to be true
        end
      end
    end

    context 'strict: false' do
      context 'when cid is present' do
        let(:value) { '2050' }

        it 'returns true' do
          expect(cid).to be_valid
        end
      end

      context 'when cid is nil' do
        let(:value) { nil }

        it 'returns true' do
          expect(cid).to be_valid
        end
      end
    end
  end
end
