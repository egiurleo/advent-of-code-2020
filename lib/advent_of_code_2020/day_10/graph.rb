# frozen_string_literal: true

module AdventOfCode2020
  class Day10
    class Graph
      attr_reader :nodes, :root_node, :end_node

      def initialize(numbers)
        numbers = numbers.dup.sort
        @nodes = nodes_hash(numbers)
        @num_paths = {}

        nodes.each_pair do |value, node|
          [1, 2, 3].each do |v|
            node2 = nodes[value + v]
            node.add_edge(Edge.new(node, node2, v)) if node2
          end
        end

        @root_node = nodes[0]
        @end_node = nodes[numbers.max + 3]
      end

      def longest_path(current_node, end_node, path = [])
        return path if current_node.equal?(end_node)

        edge = current_node.edges.first
        longest_path(edge.node_to, end_node, path.dup.concat([edge]))
      end

      def num_paths(current_node, end_node)
        return @num_paths[[current_node.value, end_node.value]] if @num_paths[[current_node.value, end_node.value]]

        return 1 if current_node.equal?(end_node)
        return 0 if current_node.edges.empty?

        val = current_node.edges.map do |edge|
          num_paths(edge.node_to, end_node)
        end.sum

        @num_paths[[current_node.value, end_node.value]] = val
        val
      end

      private

      def nodes_hash(numbers)
        nodes = { 0 => Node.new(0) }

        numbers.each do |number|
          nodes[number] = Node.new(number)
        end

        max_voltage = numbers.max + 3
        nodes[max_voltage] = Node.new(max_voltage)

        nodes
      end
    end
  end
end
