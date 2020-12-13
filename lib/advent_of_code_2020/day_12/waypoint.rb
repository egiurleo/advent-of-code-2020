# frozen_string_literal: true

module AdventOfCode2020
  class Day12
    class Waypoint < Ship
      def initialize
        super
        # POSITION RELATIVE TO THE SHIP
        @direction = nil
        @pos_x = 10
        @pos_y = 1
      end

      def direction_x
        @pos_x >= 0 ? :east : :west
      end

      def direction_y
        @pos_y >= 0 ? :north : :south
      end

      def turn(direction, degrees)
        direction1 = direction_x
        direction2 = direction_y
        val1 = @pos_x
        val2 = @pos_y

        new_direction1 = new_direction(direction1, direction, degrees)
        new_direction2 = new_direction(direction2, direction, degrees)

        assign_positions(new_direction1, val1)
        assign_positions(new_direction2, val2)
      end

      private

      def assign_positions(direction, value)
        case direction
        when :north
          @pos_y = value.abs
        when :south
          @pos_y = -1 * value.abs
        when :east
          @pos_x = value.abs
        when :west
          @pos_x = -1 * value.abs
        else
          raise "Invalid direction: #{direction}"
        end
      end
    end
  end
end
