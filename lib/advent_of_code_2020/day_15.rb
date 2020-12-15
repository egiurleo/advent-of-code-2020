# frozen_string_literal: true

require 'advent_of_code_2020/day_15/memory_game'

module AdventOfCode2020
  class Day15
    def initialize(input_file)
      @starting_numbers = AdventOfCode2020::Utils
                          .read_file(input_file)
                          .first
                          .split(',')
                          .map(&:to_i)
    end

    def part_one
      memory_game = MemoryGame.new(@starting_numbers)
      number = nil

      2020.times do
        number = memory_game.turn
      end

      number
    end

    def part_two
      memory_game = MemoryGame.new(@starting_numbers)
      number = nil

      30_000_000.times do
        number = memory_game.turn
      end

      number
    end
  end
end
