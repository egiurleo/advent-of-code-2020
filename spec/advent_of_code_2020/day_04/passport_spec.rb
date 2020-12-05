# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day04::Passport do
  let(:passport) { described_class.new(**fields) }
  let(:fields) { base_fields }
  let(:base_fields) do
    {
      ecl: 'gry',
      pid: '860033327',
      eyr: '2020',
      hcl: '#fffffd',
      byr: '1937',
      iyr: '2017',
      cid: '147',
      hgt: '183cm'
    }
  end

  describe '#valid?' do
    context 'strict: true' do
      context 'all fields are valid' do
        it 'returns true' do
          expect(passport.valid?(strict: true)).to be true
        end
      end

      context 'birth year is invalid' do
        let(:fields) { base_fields.merge(byr: 1919) }

        it 'returns false' do
          expect(passport.valid?(strict: true)).to be false
        end
      end

      context 'issue year is invalid' do
        let(:fields) { base_fields.merge(iyr: 2009) }

        it 'returns false' do
          expect(passport.valid?(strict: true)).to be false
        end
      end

      context 'expiration year is invalid' do
        let(:fields) { base_fields.merge(eyr: 2019) }

        it 'returns false' do
          expect(passport.valid?(strict: true)).to be false
        end
      end

      context 'height is invalid' do
        let(:fields) { base_fields.merge(hgt: '12ft') }

        it 'returns false' do
          expect(passport.valid?(strict: true)).to be false
        end
      end

      context 'height is good in in' do
        let(:fields) { base_fields.merge(hgt: '65in') }

        it 'returns true' do
          expect(passport.valid?(strict: true)).to be true
        end
      end

      context 'hcl is invalid' do
        let(:fields) { base_fields.merge(hcl: '#abx789') }

        it 'returns false' do
          expect(passport.valid?(strict: true)).to be false
        end
      end

      context 'ecl is an invalid color' do
        let(:fields) { base_fields.merge(ecl: 'abc') }

        it 'returns false' do
          expect(passport.valid?(strict: true)).to be false
        end
      end

      context 'pid has invalid characters' do
        let(:fields) { base_fields.merge(pid: 'abcdefghi') }

        it 'returns false' do
          expect(passport.valid?(strict: true)).to be false
        end
      end

      context 'pid is too long' do
        let(:fields) { base_fields.merge(pid: '1234567890') }

        it 'returns false' do
          expect(passport.valid?(strict: true)).to be false
        end
      end
    end

    context 'strict: false' do
      context 'when passport has all fields' do
        let(:fields) { base_fields }

        it 'returns true' do
          expect(passport).to be_valid
        end
      end

      context 'when passport has no fields' do
        let(:fields) { {} }

        it 'returns false' do
          expect(passport).not_to be_valid
        end
      end

      context 'when passport is missing ecl' do
        let(:fields) { base_fields.tap { |bf| bf.delete(:ecl) } }

        it 'returns false' do
          expect(passport).not_to be_valid
        end
      end

      context 'when passport is missing pid' do
        let(:fields) { base_fields.tap { |bf| bf.delete(:pid) } }

        it 'returns false' do
          expect(passport).not_to be_valid
        end
      end

      context 'when passport is missing cid' do
        let(:fields) { base_fields.tap { |bf| bf.delete(:cid) } }

        it 'returns true' do
          expect(passport).to be_valid
        end
      end

      context 'when passport is missing eyr' do
        let(:fields) { base_fields.tap { |bf| bf.delete(:eyr) } }

        it 'returns false' do
          expect(passport).not_to be_valid
        end
      end

      context 'when passport is missing hcl' do
        let(:fields) { base_fields.tap { |bf| bf.delete(:hcl) } }

        it 'returns false' do
          expect(passport).not_to be_valid
        end
      end

      context 'when passport is missing byr' do
        let(:fields) { base_fields.tap { |bf| bf.delete(:byr) } }

        it 'returns false' do
          expect(passport).not_to be_valid
        end
      end

      context 'when passport is missing iyr' do
        let(:fields) { base_fields.tap { |bf| bf.delete(:iyr) } }

        it 'returns false' do
          expect(passport).not_to be_valid
        end
      end

      context 'when passport is missing hgt' do
        let(:fields) { base_fields.tap { |bf| bf.delete(:hgt) } }

        it 'returns false' do
          expect(passport).not_to be_valid
        end
      end
    end
  end
end
