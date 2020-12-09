# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day09::XmasStream do
  let(:xmas_stream) do
    described_class.new(
      [35, 20, 15, 25, 47, 40, 62, 55, 65, 95, 102, 117, 150, 182, 127, 219, 299, 277, 309, 576],
      preamble_length: 5
    )
  end

  describe '#first_invalid_number' do
    it 'returns 127' do
      expect(xmas_stream.first_invalid_number).to eq(127)
    end
  end

  describe '#contiguous_set_that_sums_to' do
    it 'returns the list of numbers' do
      expect(xmas_stream.contiguous_set_that_sums_to(127)).to eq([15, 25, 47, 40])
    end
  end
end
