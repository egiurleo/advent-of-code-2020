# frozen_string_literal: true

module AdventOfCode2020
  class Day10
    class Edge
      attr_reader :node_from, :node_to, :weight

      def initialize(node_from, node_to, weight)
        @node_from = node_from
        @node_to = node_to
        @weight = weight
      end
    end
  end
end
