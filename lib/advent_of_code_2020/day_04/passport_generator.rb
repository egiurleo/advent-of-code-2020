# frozen_string_literal: true

module AdventOfCode2020
  class Day04
    module PassportGenerator
      def self.generate_many(lines)
        # @type var passport_lines: Array[String]
        # @type var passports: Array[AdventOfCode2020::Day04::Passport]
        passport_lines = []
        passports = []

        # raise ArgumentError, 'lines must be an array of Strings' if lines.nil?

        lines.each do |line|
          if line == ''
            passports << generate_one(passport_lines)
            passport_lines = []
            next
          else
            passport_lines << line
          end
        end

        unless passport_lines.empty?
          passports << generate_one(passport_lines)
          passport_lines = []
        end

        passports
      end

      def self.generate_one(lines)
        # @type var fields: Hash[Symbol, String|nil]
        fields = {}

        lines.each do |line|
          key_value_pairs = line.split
          key_value_pairs.each do |kvp|
            key, value = kvp.split(':')

            next if key.nil?

            fields[key.to_sym] = value
          end
        end

        Passport.new(**fields)
      end
    end
  end
end
