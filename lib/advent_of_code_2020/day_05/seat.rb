# frozen_string_literal: true

module AdventOfCode2020
  class Day05
    class Seat
      def initialize(code)
        @row_code = code.split('').first(7).join
        @col_code = code.split('').last(3).join
      end

      def row
        @row ||= NumberFinder.find_number(
          min: 0,
          max: 127,
          up_char: 'B',
          down_char: 'F',
          pattern: @row_code
        )
      end

      def col
        @col ||= NumberFinder.find_number(
          min: 0,
          max: 7,
          up_char: 'R',
          down_char: 'L',
          pattern: @col_code
        )
      end

      def id
        (row * 8) + col
      end
    end
  end
end
