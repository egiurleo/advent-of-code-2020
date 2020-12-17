# frozen_string_literal: true

module AdventOfCode2020
  class Day17
    class Grid
      def initialize(state, dimension = 3)
        @state = Hash.new('.')
        @adjacent_coordinates = {}

        state.each_with_index do |row, x|
          row.each_with_index do |cube, y|
            coordinate = [x, y] + [0] * (dimension - 2)
            @state[coordinate] = cube
          end
        end
      end

      def active?(coord)
        @state[coord] == '#'
      end

      def inactive?(coord)
        !active?(coord)
      end

      def state(min_x, min_y, max_x, max_y, z)
        (min_x..max_x).to_a.map do |x|
          (min_y..max_y).to_a.map do |y|
            @state[[x, y, z]]
          end
        end
      end

      def active_cubes
        @state.keys.select { |coord| active?(coord) }
      end

      def cycle
        new_state = @state.dup

        coordinates = @state.keys.dup
        @state.each_key do |coord|
          adjacent_coordinates = adjacent_coordinates(coord)
          coordinates.concat(adjacent_coordinates)
        end

        coordinates.each do |coord|
          if active?(coord) && ![2, 3].include?(num_active_neighbors(coord))
            new_state[coord] = '.'
          elsif inactive?(coord) && num_active_neighbors(coord) == 3
            new_state[coord] = '#'
          end
        end

        @state = new_state
      end

      private

      def num_active_neighbors(coordinate)
        adjacent_coordinates(coordinate).select do |coord|
          active?(coord)
        end.length
      end

      def adjacent_coordinates(coord)
        return @adjacent_coordinates[coord] if @adjacent_coordinates[coord]

        possible_coordinates = coord.map do |component|
          [component - 1, component, component + 1]
        end

        adjacent_coordinates = possible_coordinates.shift.product(*possible_coordinates)
        adjacent_coordinates.delete(coord)
        @adjacent_coordinates[coord] = adjacent_coordinates
      end
    end
  end
end
