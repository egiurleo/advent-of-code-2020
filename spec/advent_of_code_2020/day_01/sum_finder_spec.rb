# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day01::SumFinder do
  let(:sum_finder) { described_class.new([1, 2, 3, 4], 6) }

  describe '.find_two' do
    it 'finds two elements in an array that add to the target' do
      expect(sum_finder.find_two).to eq([2, 4])
    end
  end

  describe '.find_three' do
    it 'finds three elements in an array that add to the target' do
      expect(sum_finder.find_three).to eq([1, 2, 3])
    end
  end
end
