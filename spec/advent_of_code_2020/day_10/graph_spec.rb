# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day10::Graph do
  let(:graph) { described_class.new([16, 10, 15, 5, 1, 11, 7, 19, 6, 12, 4]) }

  describe '#initialize' do
    it 'creates a series of nodes and edges' do
      expect(graph.root_node.value).to eq(0)
      expect(graph.root_node.edges.length).to eq(1)
      expect(graph.root_node.edges.first.weight).to eq(1)

      node1 = graph.root_node.edges.first.node_to
      expect(node1.value).to eq(1)
      expect(node1.edges.length).to eq(1)
      expect(node1.edges.first.weight).to eq(3)

      node4 = node1.edges.first.node_to
      expect(node4.value).to eq(4)
      expect(node4.edges.length).to eq(3)
      expect(node4.edges.map(&:weight)).to match_array([1, 2, 3])

      expect(graph.end_node.value).to eq(22)
    end
  end

  describe '#num_paths' do
    let(:num_paths) { graph.num_paths(graph.root_node, graph.end_node) }

    it 'returns all the paths' do
      expect(num_paths).to eq(8)
    end
  end

  describe '#longest_path' do
    let(:longest_path) { graph.longest_path(graph.root_node, graph.end_node) }

    it 'returns one edge when the nodes are neighbors' do
      longest_path = graph.longest_path(graph.nodes[19], graph.end_node)
      expect(longest_path.length).to eq(1)
      expect(longest_path.first.weight).to eq(3)
    end

    it 'returns two edges when the nodes are two steps apart' do
      longest_path = graph.longest_path(graph.nodes[16], graph.end_node)
      expect(longest_path.length).to eq(2)
      expect(longest_path.map(&:weight).sum).to eq(6)
    end

    it 'returns the longest list of edges' do
      longest_path = graph.longest_path(graph.nodes[10], graph.end_node)
      expect(longest_path.length).to eq(6)
      expect(longest_path.map(&:weight).sum).to eq(12)
    end

    it 'returns a list of edges' do
      expect(longest_path.map(&:weight).sum).to eq(22)
    end
  end
end
