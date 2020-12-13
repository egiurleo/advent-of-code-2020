# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day12::NewNavigationSystem do
  let(:nav_system) { described_class.new(instructions) }

  describe '#follow_instruction' do
    before do
      nav_system.follow_instruction
    end

    context 'when instruction is N' do
      let(:instructions) { ['N5'] }

      it 'moves the waypoint north 5 spaces' do
        expect(nav_system.waypoint.position).to eq([10, 6])
      end
    end

    context 'when instruction is S' do
      let(:instructions) { ['S5'] }

      it 'moves the waypoint north 5 spaces' do
        expect(nav_system.waypoint.position).to eq([10, -4])
      end
    end

    context 'when instruction is E' do
      let(:instructions) { ['E5'] }

      it 'moves the waypoint north 5 spaces' do
        expect(nav_system.waypoint.position).to eq([15, 1])
      end
    end

    context 'when instruction is W' do
      let(:instructions) { ['W5'] }

      it 'moves the waypoint north 5 spaces' do
        expect(nav_system.waypoint.position).to eq([5, 1])
      end
    end

    context 'when instruction is L' do
      let(:instructions) { ['L90'] }

      it 'rotates the waypoint left 90 degrees' do
        expect(nav_system.waypoint.position).to eq([-1, 10])
      end
    end

    context 'when instruction is R' do
      let(:instructions) { ['R90'] }

      it 'rotates the waypoint right 90 degrees' do
        expect(nav_system.waypoint.position).to eq([1, -10])
      end
    end
  end
end
