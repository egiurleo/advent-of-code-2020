# frozen_string_literal: true

require 'advent_of_code_2020/day_03/map'

module AdventOfCode2020
  class Day03
    def initialize(input_file)
      @map = Map.new(AdventOfCode2020::Utils.read_file(input_file))
    end

    # You start on the open square in the top-left corner and need to reach the
    # bottom (below the bottom-most row on your map).
    #
    # From your starting position at the top-left, check the position that is
    # right 3 and down 1. Then, check the position that is right 3 and down 1
    # from there, and so on until you go past the bottom of the map.
    #
    # Starting at the top-left corner of your map and following a slope of right
    # 3 and down 1, how many trees would you encounter?
    def part_one
      trees_on_slope(3, 1)
    end

    # Time to check the rest of the slopes - you need to minimize the probability
    # of a sudden arboreal stop, after all.
    #
    # Determine the number of trees you would encounter if, for each of the
    # following slopes, you start at the top-left corner and traverse the map
    # all the way to the bottom:
    #
    # Right 1, down 1.
    # Right 3, down 1. (This is the slope you already checked.)
    # Right 5, down 1.
    # Right 7, down 1.
    # Right 1, down 2.
    #
    # What do you get if you multiply together the number of trees encountered
    # on each of the listed slopes?
    def part_two
      slopes = [
        [1, 1],
        [3, 1],
        [5, 1],
        [7, 1],
        [1, 2]
      ]

      slopes.map do |right, down|
        next if right.nil? || down.nil?

        trees_on_slope(right, down)
      end.reduce(:*)
    end

    private

    def trees_on_slope(right, down)
      row = 0
      col = 0
      trees = 0

      until @map.bottom?(row)
        trees += 1 if @map.tree?(row, col)
        row += down
        col += right
      end

      trees
    end
  end
end
