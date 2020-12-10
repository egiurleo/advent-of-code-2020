# frozen_string_literal: true

module AdventOfCode2020
  class Day10
    class Node
      attr_reader :value, :edges

      def initialize(value)
        @edges = []
        @value = value
      end

      def add_edge(edge)
        @edges << edge
      end
    end
  end
end
