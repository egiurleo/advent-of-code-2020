# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day04::PassportGenerator do
  describe '.generate_many' do
    let(:lines) { AdventOfCode2020::Utils.read_file('spec/mock_data/day_04.txt') }
    let(:passports) { described_class.generate_many(lines) }

    it 'returns four passports, two of which are valid' do
      expect(passports.length).to eq(4)
    end
  end

  describe '.generate_one' do
    let(:passport) { described_class.generate_one(lines) }

    context 'all info is on one line' do
      let(:lines) do
        ['ecl:gry pid:860033327 eyr:2020 hcl:#fffffd byr:1937 iyr:2017 cid:147 hgt:183cm']
      end

      it 'creates a passport with the correct information' do
        expect(passport).to be_valid
      end
    end

    context 'info is on two lines' do
      let(:lines) do
        ['ecl:gry pid:860033327 eyr:2020 hcl:#fffffd', 'byr:1937 iyr:2017 cid:147 hgt:183cm']
      end

      it 'creates a passport with the correct information' do
        expect(passport).to be_valid
      end
    end

    context 'info is on four lines' do
      let(:lines) do
        ['hcl:#fffffd iyr:2017', 'eyr:2020', 'ecl:gry pid:860033327 byr:1937', 'hgt:183cm cid:147']
      end

      it 'creates a passport with the correct information' do
        expect(passport).to be_valid
      end
    end
  end
end
