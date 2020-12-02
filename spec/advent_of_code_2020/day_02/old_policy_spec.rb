# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day02::OldPolicy do
  let(:policy) { described_class.new('1-3 a') }

  describe '#valid?' do
    it 'returns false when password contains none of the letter' do
      expect(policy.valid?('kitty')).to be false
    end

    it 'returns true when password contains the minimum number' do
      expect(policy.valid?('cat')).to be true
    end

    it 'returns true when password contains a middle number' do
      expect(policy.valid?('catcat')).to be true
    end

    it 'returns true when password contains the maximum number' do
      expect(policy.valid?('catcatcat')).to be true
    end

    it 'returns true when the letters are all in a row' do
      expect(policy.valid?('aaa')).to be true
    end

    it 'returns false when password contains too many of the letter' do
      expect(policy.valid?('catcatcatcat')).to be false
    end
  end
end
