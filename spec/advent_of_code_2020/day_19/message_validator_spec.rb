# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day19::MessageValidator do
  describe '#initialize' do
    it 'properly creates the rules' do
      validator = described_class.new([
                                        '0: 1 2',
                                        '1: "a"',
                                        '2: 1 3 | 3 1',
                                        '3: "b"'
                                      ])

      expect(validator.instance_variable_get(:@rules)).to eq({
                                                               0 => '(a(ab|ba))',
                                                               1 => 'a',
                                                               2 => '(ab|ba)',
                                                               3 => 'b'
                                                             })
    end

    it 'properly creates the rules' do
      validator = described_class.new([
                                        '0: 4 1 5',
                                        '1: 2 3 | 3 2',
                                        '2: 4 4 | 5 5',
                                        '3: 4 5 | 5 4',
                                        '4: "a"',
                                        '5: "b"'
                                      ])

      expect(validator.instance_variable_get(:@rules)).to eq({
                                                               0 => '(a((aa|bb)(ab|ba)|(ab|ba)(aa|bb))b)',
                                                               1 => '((aa|bb)(ab|ba)|(ab|ba)(aa|bb))',
                                                               2 => '(aa|bb)',
                                                               3 => '(ab|ba)',
                                                               4 => 'a',
                                                               5 => 'b'
                                                             })
    end
  end

  describe '#valid?' do
    let(:validator) do
      described_class.new([
                            '0: 4 1 5',
                            '1: 2 3 | 3 2',
                            '2: 4 4 | 5 5',
                            '3: 4 5 | 5 4',
                            '4: "a"',
                            '5: "b"'
                          ])
    end

    it 'considers aaaabb valid' do
      expect(validator.valid?('aaaabb')).to be true
    end

    it 'considers aaabab valid' do
      expect(validator.valid?('aaabab')).to be true
    end

    it 'considers abbabb valid' do
      expect(validator.valid?('abbabb')).to be true
    end

    it 'considers abbbab valid' do
      expect(validator.valid?('abbbab')).to be true
    end

    it 'considers aabaab valid' do
      expect(validator.valid?('aabaab')).to be true
    end

    it 'considers aabbbb valid' do
      expect(validator.valid?('aabbbb')).to be true
    end

    it 'considers abaaab valid' do
      expect(validator.valid?('abaaab')).to be true
    end

    it 'considers ababbb valid' do
      expect(validator.valid?('ababbb')).to be true
    end

    it 'does not consider a random string valid' do
      expect(validator.valid?('hello world')).to be false
    end

    it 'does not consider a short string valid' do
      expect(validator.valid?('a')).to be false
    end

    it 'does not consider a long string valid' do
      expect(validator.valid?('ababbbb')).to be false
    end
  end
end
