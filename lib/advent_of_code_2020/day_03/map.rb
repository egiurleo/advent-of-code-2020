# frozen_string_literal: true

module AdventOfCode2020
  class Day03
    class Map
      def initialize(map_rows)
        @map = map_rows.map do |row|
          row.split('')
        end
      end

      def bottom?(row)
        row >= @map.length
      end

      def tree?(row, col)
        return if row >= @map.length

        col_length = @map.first&.length
        raise 'Invalid map' if col_length.nil?

        multiplier = (col / col_length).floor
        @map[row][col - (col_length * multiplier)] == '#'
      end
    end
  end
end
