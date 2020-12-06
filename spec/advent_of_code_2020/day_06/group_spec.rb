# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day06::Group do
  let(:group) { described_class.new(lines) }

  describe '#number_questions_everybody_answered' do
    context 'when group has one line with multiple questions' do
      let(:lines) { ['abc'] }

      it 'returns 3' do
        expect(group.number_questions_everybody_answered).to eq(3)
      end
    end

    context 'when group has three lines with multiple questions' do
      let(:lines) { %w[a b c] }

      it 'returns 0' do
        expect(group.number_questions_everybody_answered).to eq(0)
      end
    end

    context 'when group has two lines with questions overlapping' do
      let(:lines) { %w[ab ac] }

      it 'returns 1' do
        expect(group.number_questions_everybody_answered).to eq(1)
      end
    end

    context 'when group has multiple lines with the same question' do
      let(:lines) { %w[a a a a] }

      it 'returns 1' do
        expect(group.number_questions_everybody_answered).to eq(1)
      end
    end

    context 'when group has one line with the one question' do
      let(:lines) { ['a'] }

      it 'returns 1' do
        expect(group.number_questions_everybody_answered).to eq(1)
      end
    end
  end

  describe '#number_questions_answered' do
    context 'when group has one line with multiple questions' do
      let(:lines) { ['abc'] }

      it 'returns 3' do
        expect(group.number_questions_answered).to eq(3)
      end
    end

    context 'when group has three lines with multiple questions' do
      let(:lines) { %w[a b c] }

      it 'returns 3' do
        expect(group.number_questions_answered).to eq(3)
      end
    end

    context 'when group has two lines with questions overlapping' do
      let(:lines) { %w[ab ac] }

      it 'returns 3' do
        expect(group.number_questions_answered).to eq(3)
      end
    end

    context 'when group has multiple lines with the same question' do
      let(:lines) { %w[a a a a] }

      it 'returns 1' do
        expect(group.number_questions_answered).to eq(1)
      end
    end

    context 'when group has one line with the one question' do
      let(:lines) { ['a'] }

      it 'returns 1' do
        expect(group.number_questions_answered).to eq(1)
      end
    end
  end
end
