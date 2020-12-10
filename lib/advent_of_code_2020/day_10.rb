# frozen_string_literal: true

require 'advent_of_code_2020/day_10/graph'
require 'advent_of_code_2020/day_10/edge'
require 'advent_of_code_2020/day_10/node'

module AdventOfCode2020
  class Day10
    def initialize(input_file)
      @numbers = AdventOfCode2020::Utils.read_file(input_file, transform: :to_i)
      @graph = Graph.new(@numbers)
    end

    def part_one
      longest_path = @graph.longest_path(@graph.root_node, @graph.end_node)
      number_1_edges = longest_path.count { |edge| edge.weight == 1 }
      number_3_edges = longest_path.count { |edge| edge.weight == 3 }

      number_1_edges * number_3_edges
    end

    def part_two
      @graph.num_paths(@graph.root_node, @graph.end_node)
    end
  end
end
