# frozen_string_literal: true

module AdventOfCode2020
  class Day11
    class SeatSimulator
      def initialize(lines)
        @state = build_state(lines)
        @round = 0
      end

      def exists?(row, col)
        !@state[[row, col]].nil?
      end

      def empty?(row, col)
        @state[[row, col]] == 'L'
      end

      def occupied?(row, col)
        @state[[row, col]] == '#'
      end

      def floor?(row, col)
        @state[[row, col]] == '.'
      end

      def round(lenient: false)
        new_state = {}

        @state.each do |coords, _|
          x, y = coords
          new_state[[x, y]] = new_seat_state(x, y, lenient: lenient)
        end

        @round += 1
        @state = new_state
      end

      def run_until_stable(lenient: false)
        old_state = {}
        new_state = @state

        while old_state != new_state
          round(lenient: lenient)

          old_state = new_state
          new_state = @state
        end
      end

      def to_s
        string_rep = ''
        i = 0

        until @state[[i, 0]].nil?
          j = 0
          until @state[[i, j]].nil?
            string_rep += @state[[i, j]]
            j += 1
          end

          string_rep += "\n"
          i += 1
        end

        string_rep
      end

      def num_occupied_seats
        @state.select do |coord, _|
          x, y = coord
          occupied?(x, y)
        end.length
      end

      private

      def new_seat_state(row, col, lenient: false)
        if empty?(row, col)
          if lenient
            return '#' if num_visible_empty_seats(row, col) == 8
          elsif num_adjacent_empty_seats(row, col) == 8
            return '#'
          end
        elsif occupied?(row, col)
          if lenient
            return 'L' if num_visible_occupied_seats(row, col) >= 5
          elsif num_adjacent_occupied_seats(row, col) >= 4
            return 'L'
          end
        end

        @state[[row, col]]
      end

      def first_visible_seat(row, col, directions:)
        i = row
        j = col

        loop do
          i -= 1 if directions.include?(:up)
          i += 1 if directions.include?(:down)
          j -= 1 if directions.include?(:left)
          j += 1 if directions.include?(:right)

          return [i, j] if !exists?(i, j) || !floor?(i, j)
        end
      end

      def num_visible_occupied_seats(row, col)
        seats = directions.map { |direction| first_visible_seat(row, col, directions: direction) }
        seats.select do |coord|
          i, j = coord
          exists?(i, j) && occupied?(i, j)
        end.length
      end

      def num_visible_empty_seats(row, col)
        seats = directions.map { |direction| first_visible_seat(row, col, directions: direction) }
        seats.select do |coord|
          i, j = coord
          !exists?(i, j) || empty?(i, j)
        end.length
      end

      def num_adjacent_occupied_seats(row, col)
        adjacent_coordinates(row, col).select do |coord|
          i, j = coord
          exists?(i, j) && occupied?(i, j)
        end.length
      end

      def num_adjacent_empty_seats(row, col)
        adjacent_coordinates(row, col).select do |coord|
          i, j = coord
          !exists?(i, j) || empty?(i, j) || floor?(i, j)
        end.length
      end

      def adjacent_coordinates(row, col)
        [
          [row - 1, col - 1],
          [row - 1, col],
          [row - 1, col + 1],
          [row, col - 1],
          [row, col + 1],
          [row + 1, col - 1],
          [row + 1, col],
          [row + 1, col + 1]
        ]
      end

      def directions
        [
          [:up],
          [:down],
          [:left],
          [:right],
          %i[up right],
          %i[up left],
          %i[down right],
          %i[down left]
        ]
      end

      def build_state(lines)
        state = {}
        # seats = Array.new(lines.length) { Array.new(lines.first.length) }

        lines.each_with_index do |line, i|
          line.split('').each_with_index do |char, j|
            state[[i, j]] = char
          end
        end

        state
      end
    end
  end
end
