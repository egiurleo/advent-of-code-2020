# frozen_string_literal: true

module AdventOfCode2020
  class Day12
    class NewNavigationSystem < NavigationSystem
      attr_reader :waypoint

      def initialize(instructions)
        super
        @waypoint = Waypoint.new
      end

      def follow_instruction
        instruction = @instructions.shift
        direction = instruction.split('').first
        value = instruction.split('')[1..].join.to_i

        case direction
        when 'N'
          waypoint.move(:north, value)
        when 'S'
          waypoint.move(:south, value)
        when 'E'
          waypoint.move(:east, value)
        when 'W'
          waypoint.move(:west, value)
        when 'L'
          waypoint.turn(:left, value)
        when 'R'
          waypoint.turn(:right, value)
        when 'F'
          ship.move(waypoint.direction_x, waypoint.position.first.abs * value)
          ship.move(waypoint.direction_y, waypoint.position.last.abs * value)
        else
          raise "Invalid instruction: #{instruction}"
        end
      end
    end
  end
end
