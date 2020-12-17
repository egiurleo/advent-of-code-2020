# frozen_string_literal: true

require 'advent_of_code_2020/day_17/grid'

module AdventOfCode2020
  class Day17
    def initialize(input_file)
      @state = AdventOfCode2020::Utils.read_file(input_file).map do |line|
        line.split('')
      end
    end

    def part_one
      grid = Grid.new(@state)

      6.times do
        grid.cycle
      end

      grid.active_cubes.length
    end

    def part_two
      grid = Grid.new(@state, 4)

      6.times do
        grid.cycle
      end

      grid.active_cubes.length
    end
  end
end
