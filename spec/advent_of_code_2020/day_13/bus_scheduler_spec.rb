# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day13::BusScheduler do
  describe '.wait_time' do
    it 'returns the wait time' do
      expect(described_class.wait_time(939, 7)).to eq(6)
    end

    it 'returns the wait time' do
      expect(described_class.wait_time(939, 3)).to eq(0)
    end
  end

  describe '.earliest_timestamp' do
    it 'returns the earliest timestamp' do
      expect(
        described_class.earliest_timestamp([7, 13, 'x', 'x', 59, 'x', 31, 19])
      ).to eq(1_068_781)
    end

    it 'returns the earliest timestamp' do
      expect(
        described_class.earliest_timestamp([17, 'x', 13, 19])
      ).to eq(3_417)
    end

    it 'returns the earliest timestamp' do
      expect(
        described_class.earliest_timestamp([67, 7, 59, 61])
      ).to eq(754_018)
    end

    it 'returns the earliest timestamp' do
      expect(
        described_class.earliest_timestamp([67, 'x', 7, 59, 61])
      ).to eq(779_210)
    end
  end
end
