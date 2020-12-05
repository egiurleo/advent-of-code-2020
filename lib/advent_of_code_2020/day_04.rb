# frozen_string_literal: true

require 'advent_of_code_2020/day_04/passport'
require 'advent_of_code_2020/day_04/passport/field'
require 'advent_of_code_2020/day_04/passport/birth_year'
require 'advent_of_code_2020/day_04/passport/cid'
require 'advent_of_code_2020/day_04/passport/expiration_year'
require 'advent_of_code_2020/day_04/passport/eye_color'
require 'advent_of_code_2020/day_04/passport/hair_color'
require 'advent_of_code_2020/day_04/passport/height'
require 'advent_of_code_2020/day_04/passport/issue_year'
require 'advent_of_code_2020/day_04/passport/pid'
require 'advent_of_code_2020/day_04/passport_generator'

module AdventOfCode2020
  class Day04
    def initialize(input_file)
      @passports = PassportGenerator.generate_many(
        AdventOfCode2020::Utils.read_file(input_file)
      )
    end

    # Count the number of valid passports - those that have all required fields.
    # Treat cid as optional. In your batch file, how many passports are valid?
    def part_one
      @passports.select { |pp| pp.valid?(strict: false) }.length
    end

    # You can continue to ignore the cid field, but each other field has strict
    # rules about what values are valid for automatic validation:
    #
    # byr (Birth Year) - four digits; at least 1920 and at most 2002.
    # iyr (Issue Year) - four digits; at least 2010 and at most 2020.
    # eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
    # hgt (Height) - a number followed by either cm or in:
    # If cm, the number must be at least 150 and at most 193.
    # If in, the number must be at least 59 and at most 76.
    # hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
    # ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
    # pid (Passport ID) - a nine-digit number, including leading zeroes.
    # cid (Country ID) - ignored, missing or not.
    #
    # Count the number of valid passports - those that have all required fields
    # and valid values. Continue to treat cid as optional. In your batch file,
    # how many passports are valid?
    def part_two
      @passports.select { |pp| pp.valid?(strict: true) }.length
    end
  end
end
