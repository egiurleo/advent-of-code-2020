# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day07::Node do
  let(:node) { described_class.new('light red') }
  let(:node2) { described_class.new('dark orange') }

  describe '#initialize' do
    it 'creates a new node' do
      expect(node.name).to eq('light red')
      expect(node.children).to eq([])
      expect(node.parents).to eq([])
    end
  end

  describe '#add_child' do
    it 'adds a node to the children array' do
      node.add_child(node2)
      expect(node.children).to eq([[node2, 1]])
      expect(node.parents).to eq([])
      expect(node2.children).to eq([])
      expect(node2.parents).to eq([node])
    end
  end

  describe '#num_parents' do
    it 'returns 0 for node with no parents' do
      node = described_class.new('faded blue')
      expect(node.num_parents).to eq(0)
    end

    it 'returns 1 for node with 1 parent' do
      node = described_class.new('faded blue')
      node2 = described_class.new('bright white')
      node.add_child(node2)

      expect(node2.num_parents).to eq(1)
    end

    it 'returns 2 for node with multi-level parents' do
      node = described_class.new('faded blue')
      node2 = described_class.new('bright white')
      node3 = described_class.new('shiny gold')
      node.add_child(node2)
      node2.add_child(node3)

      expect(node3.num_parents).to eq(2)
    end
  end

  describe '#num_children' do
    it 'returns 0 for node with no children' do
      node = described_class.new('faded blue')
      expect(node.num_children).to eq(0)
    end

    it 'returns 1 for node with one child with value 1' do
      node = described_class.new('faded blue')
      node2 = described_class.new('bright white')
      node.add_child(node2, 1)

      expect(node.num_children).to eq(1)
    end

    it 'returns 6 for node with one child with value 6' do
      node = described_class.new('faded blue')
      node2 = described_class.new('bright white')
      node.add_child(node2, 6)

      expect(node.num_children).to eq(6)
    end

    it 'returns 9 for node with two children with values 4 and 5' do
      node = described_class.new('faded blue')
      node2 = described_class.new('bright white')
      node3 = described_class.new('shiny gold')
      node.add_child(node2, 4)
      node2.add_child(node3, 5)

      expect(node.num_children).to eq(24)
    end
  end
end
