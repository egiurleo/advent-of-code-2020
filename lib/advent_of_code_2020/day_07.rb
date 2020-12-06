# frozen_string_literal: true

require 'advent_of_code_2020/day_07/graph'
require 'advent_of_code_2020/day_07/node'

module AdventOfCode2020
  class Day07
    def initialize(input_file)
      @graph = Graph.new(AdventOfCode2020::Utils.read_file(input_file))
    end

    def part_one
      @graph.nodes['shiny gold'].num_parents
    end

    def part_two
      @graph.nodes['shiny gold'].num_children
    end
  end
end
