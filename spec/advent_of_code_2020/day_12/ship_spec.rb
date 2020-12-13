# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day12::Ship do
  let(:ship) { described_class.new }

  describe '#turn' do
    it 'turns the ship right 0 degrees' do
      ship.turn(:right, 0)
      expect(ship.direction).to eq(:east)
    end

    it 'turns the ship right 90 degrees' do
      ship.turn(:right, 90)
      expect(ship.direction).to eq(:south)
    end

    it 'turns the ship right 180 degrees' do
      ship.turn(:right, 180)
      expect(ship.direction).to eq(:west)
    end

    it 'turns the ship right 270 degrees' do
      ship.turn(:right, 270)
      expect(ship.direction).to eq(:north)
    end

    it 'turns the ship right 360 degrees' do
      ship.turn(:right, 360)
      expect(ship.direction).to eq(:east)
    end

    it 'turns the ship right 450 degrees' do
      ship.turn(:right, 450)
      expect(ship.direction).to eq(:south)
    end

    it 'turns the ship left 0 degrees' do
      ship.turn(:left, 0)
      expect(ship.direction).to eq(:east)
    end

    it 'turns the ship left 90 degrees' do
      ship.turn(:left, 90)
      expect(ship.direction).to eq(:north)
    end

    it 'turns the ship left 180 degrees' do
      ship.turn(:left, 180)
      expect(ship.direction).to eq(:west)
    end

    it 'turns the ship left 270 degrees' do
      ship.turn(:left, 270)
      expect(ship.direction).to eq(:south)
    end

    it 'turns the ship left 360 degrees' do
      ship.turn(:left, 360)
      expect(ship.direction).to eq(:east)
    end

    it 'turns the ship left 450 degrees' do
      ship.turn(:left, 450)
      expect(ship.direction).to eq(:north)
    end
  end

  describe '#move' do
    it 'moves the ship north' do
      ship.move(:north, 5)
      expect(ship.position).to eq([0, 5])
    end

    it 'moves the ship north' do
      ship.move(:north, 5)
      expect(ship.position).to eq([0, 5])
    end

    it 'moves the ship south' do
      ship.move(:south, 5)
      expect(ship.position).to eq([0, -5])
    end

    it 'moves the ship east' do
      ship.move(:east, 5)
      expect(ship.position).to eq([5, 0])
    end

    it 'moves the ship west' do
      ship.move(:west, 5)
      expect(ship.position).to eq([-5, 0])
    end

    it 'moves the ship forward' do
      ship.move(:forward, 5)
      expect(ship.position).to eq([5, 0])
    end
  end
end
