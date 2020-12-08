# frozen_string_literal: true

module AdventOfCode2020
  class Day08
    class Game
      attr_reader :accumulator

      def initialize(instructions)
        @instructions = instructions
        @position = 0
        @accumulator = 0
        @exit_code = 0 # 0 => never exited, 1 => natural exit, 2 => infinite loop
      end

      def run
        seen = Hash.new(false)

        loop do
          if seen[@position]
            @exit_code = 2
            break
          elsif @position >= @instructions.length
            @exit_code = 1
            break
          end

          seen[@position] = true

          instruction = @instructions[@position]
          operation = instruction[:operation]
          value = instruction[:value]

          case operation
          when 'acc'
            @accumulator += value
            @position += 1
          when 'jmp'
            @position += value
          when 'nop'
            @position += 1
          else
            raise "Invalid operation: #{operation}"
          end
        end
      end

      def infinite_loop?
        @exit_code == 2
      end
    end
  end
end
