# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day07::Graph do
  let(:graph) do
    described_class.new([
                          'light red bags contain 1 bright white bag, 2 muted yellow bags.',
                          'bright white bags contain 6 shiny gold bag.',
                          'faded blue bags contain no other bags.'
                        ])
  end

  describe '#initialize' do
    it 'creates the right nodes with the right connections' do
      expect(graph.nodes.length).to eq(5)
      expect(graph.nodes.keys).to eq(['light red', 'bright white', 'muted yellow', 'shiny gold', 'faded blue'])
      expect(graph.nodes.values.map(&:name)).to eq(
        [
          'light red',
          'bright white',
          'muted yellow',
          'shiny gold',
          'faded blue'
        ]
      )

      expect(graph.nodes['light red'].children.map(&:first).map(&:name)).to eq(['bright white', 'muted yellow'])
      expect(graph.nodes['light red'].children.map(&:last)).to eq([1, 2])
      expect(graph.nodes['bright white'].children.map(&:first).map(&:name)).to eq(['shiny gold'])
      expect(graph.nodes['bright white'].children.map(&:last)).to eq([6])
      expect(graph.nodes['bright white'].parents.map(&:name)).to eq(['light red'])
      expect(graph.nodes['faded blue'].parents).to eq([])
      expect(graph.nodes['faded blue'].children).to eq([])
    end
  end
end
