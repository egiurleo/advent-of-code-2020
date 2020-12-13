# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day12::Waypoint do
  let(:waypoint) { described_class.new }

  describe '#turn' do
    it 'turns the waypoint 0 degrees to the right' do
      waypoint.turn(:right, 0)
      expect(waypoint.position).to eq([10, 1])
    end

    it 'turns the waypoint 90 degrees to the right' do
      waypoint.turn(:right, 90)
      expect(waypoint.position).to eq([1, -10])
    end

    it 'turns the waypoint 180 degrees to the right' do
      waypoint.turn(:right, 180)
      expect(waypoint.position).to eq([-10, -1])
    end

    it 'turns the waypoint 270 degrees to the right' do
      waypoint.turn(:right, 270)
      expect(waypoint.position).to eq([-1, 10])
    end

    it 'turns the waypoint 360 degrees to the right' do
      waypoint.turn(:right, 360)
      expect(waypoint.position).to eq([10, 1])
    end

    it 'turns the waypoint 0 degrees to the left' do
      waypoint.turn(:left, 0)
      expect(waypoint.position).to eq([10, 1])
    end

    it 'turns the waypoint 90 degrees to the left' do
      waypoint.turn(:left, 90)
      expect(waypoint.position).to eq([-1, 10])
    end

    it 'turns the waypoint 180 degrees to the left' do
      waypoint.turn(:left, 180)
      expect(waypoint.position).to eq([-10, -1])
    end

    it 'turns the waypoint 270 degrees to the left' do
      waypoint.turn(:left, 270)
      expect(waypoint.position).to eq([1, -10])
    end

    it 'turns the waypoint 360 degrees to the left' do
      waypoint.turn(:left, 360)
      expect(waypoint.position).to eq([10, 1])
    end
  end
end
