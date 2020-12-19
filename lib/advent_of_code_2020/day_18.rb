# frozen_string_literal: true

require 'advent_of_code_2020/day_18/expression'

module AdventOfCode2020
  class Day18
    def initialize(input_file)
      @expressions = AdventOfCode2020::Utils.read_file(input_file).map do |line|
        Expression.new(line)
      end
    end

    def part_one
      @expressions.map(&:evaluate).sum
    end

    def part_two; end
  end
end
