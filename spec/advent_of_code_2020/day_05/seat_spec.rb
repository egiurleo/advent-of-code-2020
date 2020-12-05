# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day05::Seat do
  let(:seat) { described_class.new('BFFFBBFRRR') }

  describe '#col' do
    it 'equals 7' do
      expect(seat.col).to eq(7)
    end
  end

  describe '#row' do
    it 'equals 70' do
      expect(seat.row).to eq(70)
    end
  end

  describe '#id' do
    it 'equals 567' do
      expect(seat.id).to eq(567)
    end
  end
end
