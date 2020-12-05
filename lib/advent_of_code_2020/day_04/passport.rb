# frozen_string_literal: true

module AdventOfCode2020
  class Day04
    class Passport
      # @dynamic, ecl, pid, eyr, hcl, byr, iyr, cid, hgt
      attr_reader :ecl, :pid, :eyr, :hcl, :byr, :iyr, :cid, :hgt

      # !expects MethodArityMismatch: method=initialize
      def initialize(**fields)
        @ecl = EyeColor.new(fields[:ecl])
        @pid = Pid.new(fields[:pid])
        @eyr = ExpirationYear.new(fields[:eyr])
        @hcl = HairColor.new(fields[:hcl])
        @byr = BirthYear.new(fields[:byr])
        @iyr = IssueYear.new(fields[:iyr])
        @cid = Cid.new(fields[:cid])
        @hgt = Height.new(fields[:hgt])
      end

      def valid?(strict: false)
        [ecl, eyr, pid, hcl, byr, iyr, hgt, cid].all? { |field| field.valid?(strict: strict) }
      end
    end
  end
end
