# frozen_string_literal: true

module AdventOfCode2020
  class Day07
    class Graph
      attr_reader :nodes

      def initialize(lines)
        @nodes = {}

        lines.each do |line|
          parent, children = line.split('contain').map(&:strip)

          parent_node_name = parent.split.first(2).join(' ')
          parent_node = @nodes[parent_node_name] ||= Node.new(parent_node_name)

          next if children == 'no other bags.'

          children.split(', ').each do |child|
            words = child.split
            value = words.first.to_i
            name = words[1..2].join(' ')

            child_node = @nodes[name] ||= Node.new(name)
            parent_node.add_child(child_node, value)
          end
        end
      end
    end
  end
end
