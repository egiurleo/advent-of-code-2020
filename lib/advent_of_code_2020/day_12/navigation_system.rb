# frozen_string_literal: true

module AdventOfCode2020
  class Day12
    class NavigationSystem
      attr_reader :ship

      def initialize(instructions)
        @ship = Ship.new
        @instructions = instructions.dup
      end

      def follow_all_instructions
        follow_instruction until @instructions.empty?
      end

      def follow_instruction
        instruction = @instructions.shift
        direction = instruction.split('').first
        value = instruction.split('')[1..].join.to_i

        case direction
        when 'N'
          ship.move(:north, value)
        when 'S'
          ship.move(:south, value)
        when 'E'
          ship.move(:east, value)
        when 'W'
          ship.move(:west, value)
        when 'L'
          ship.turn(:left, value)
        when 'R'
          ship.turn(:right, value)
        when 'F'
          ship.move(:forward, value)
        else
          raise "Invalid instruction: #{instruction}"
        end
      end
    end
  end
end
