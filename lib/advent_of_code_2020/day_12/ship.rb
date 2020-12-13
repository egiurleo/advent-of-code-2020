# frozen_string_literal: true

module AdventOfCode2020
  class Day12
    class Ship
      DIRECTION_TO_DEGREES = { north: 0, east: 90, south: 180, west: 270 }.freeze
      DEGREES_TO_DIRECTION = { 0 => :north, 90 => :east, 180 => :south, 270 => :west }.freeze

      attr_reader :direction

      # East/West is +/- x
      # North/South is +/- y
      def initialize
        @direction = :east
        @pos_x = 0
        @pos_y = 0
      end

      def position
        [@pos_x, @pos_y]
      end

      def move(direction, value)
        case direction
        when :east
          @pos_x += value
        when :south
          @pos_y -= value
        when :west
          @pos_x -= value
        when :north
          @pos_y += value
        when :forward
          move(@direction, value)
        else
          raise "Invalid direction: #{direction}"
        end
      end

      def turn(direction, degrees)
        @direction = new_direction(@direction, direction, degrees)
      end

      def manhattan_distance
        @pos_x.abs + @pos_y.abs
      end

      private

      def new_direction(old_direction, turn_direction, degrees)
        current_degrees = DIRECTION_TO_DEGREES[old_direction]

        new_degrees = case turn_direction
                      when :right
                        (current_degrees + degrees) % 360
                      when :left
                        ((current_degrees - degrees) % 360).abs
                      else
                        raise "Invalid direction: #{direction}"
                      end

        DEGREES_TO_DIRECTION[new_degrees]
      end
    end
  end
end
