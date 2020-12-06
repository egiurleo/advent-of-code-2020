# frozen_string_literal: true

module AdventOfCode2020
  class Day07
    class Node
      attr_reader :children, :name, :parents

      def initialize(name)
        @name = name
        @children = []
        @parents = []
      end

      def add_child(node, value = 1)
        @children << [node, value]
        node.add_parent(self)
      end

      def add_parent(node)
        @parents << node
      end

      def num_parents
        return 0 if parents.empty?

        seen_parents = {}
        queue = parents.dup

        until queue.empty?
          node = queue.shift
          next if seen_parents[node.name]

          seen_parents[node.name] = true
          queue.concat(node.parents)
        end

        seen_parents.length
      end

      def num_children
        return 0 if children.empty?

        children.map do |node, value|
          (1 + node.num_children) * value
        end.reduce(&:+)
      end
    end
  end
end
