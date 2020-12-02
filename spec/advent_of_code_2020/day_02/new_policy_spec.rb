# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day02::NewPolicy do
  let(:policy) { described_class.new('1-3 a') }

  describe '#valid?' do
    it 'returns false when letter is not at either position' do
      expect(policy.valid?('cat')).to be false
    end

    it 'returns true when letter is at first position' do
      expect(policy.valid?('art')).to be true
    end

    it 'returns true when letter is at second position' do
      expect(policy.valid?('ska')).to be true
    end

    it 'returns false when letter is at both positions' do
      expect(policy.valid?('aba')).to be false
    end
  end
end
