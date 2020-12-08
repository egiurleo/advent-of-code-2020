# frozen_string_literal: true

require 'advent_of_code_2020/day_08/game'

module AdventOfCode2020
  class Day08
    def initialize(input_file)
      @instructions = AdventOfCode2020::Utils.read_file(input_file)
                                             .map do |instruction|
        operation, value_str = instruction.split
        value = value_str.to_i

        { operation: operation, value: value }
      end
    end

    def part_one
      game = Game.new(@instructions)
      game.run
      game.accumulator
    end

    def part_two
      @instructions.each_with_index do |instruction, index|
        case instruction[:operation]
        when 'nop'
          new_instructions = @instructions.dup
          new_instructions[index] = instruction.merge(operation: 'jmp')
        when 'jmp'
          new_instructions = @instructions.dup
          new_instructions[index] = instruction.merge(operation: 'nop')
        else
          next
        end

        game = Game.new(new_instructions)
        game.run

        return game.accumulator unless game.infinite_loop?
      end
    end
  end
end
