# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day17::Grid do
  let(:grid) { described_class.new([['.', '#', '.'], ['.', '.', '#'], ['#', '#', '#']]) }

  describe '#cycle' do
    it 'has an initial state when no cycles occur' do
      expect(grid.state(0, 0, 2, 2, 0)).to eq([
                                                %w[. # .],
                                                %w[. . #],
                                                %w[# # #]
                                              ])
    end

    it 'has the correct state after one cycle' do
      grid.cycle

      expect(grid.state(1, 0, 4, 3, -2)).to eq([
                                                 %w[. . . .],
                                                 %w[. . . .],
                                                 %w[. . . .],
                                                 %w[. . . .]
                                               ])

      expect(grid.state(1, 0, 4, 3, -1)).to eq([
                                                 %w[# . . .],
                                                 %w[. . # .],
                                                 %w[. # . .],
                                                 %w[. . . .]
                                               ])

      expect(grid.state(1, 0, 4, 3, 0)).to eq([
                                                %w[# . # .],
                                                %w[. # # .],
                                                %w[. # . .],
                                                %w[. . . .]
                                              ])

      expect(grid.state(1, 0, 4, 3, 1)).to eq([
                                                %w[# . . .],
                                                %w[. . # .],
                                                %w[. # . .],
                                                %w[. . . .]
                                              ])

      expect(grid.state(1, 0, 3, 2, 2)).to eq([
                                                %w[. . .],
                                                %w[. . .],
                                                %w[. . .]
                                              ])
    end

    it 'has the correct state after two cycles' do
      2.times do
        grid.cycle
      end

      expect(grid.state(0, -1, 4, 3, -2)).to eq([
                                                  %w[. . . . .],
                                                  %w[. . . . .],
                                                  %w[. . # . .],
                                                  %w[. . . . .],
                                                  %w[. . . . .]
                                                ])

      expect(grid.state(0, -1, 4, 3, -1)).to eq([
                                                  %w[. . # . .],
                                                  %w[. # . . #],
                                                  %w[. . . . #],
                                                  %w[. # . . .],
                                                  %w[. . . . .]
                                                ])

      expect(grid.state(0, -1, 4, 3, 0)).to eq([
                                                 %w[# # . . .],
                                                 %w[# # . . .],
                                                 %w[# . . . .],
                                                 %w[. . . . #],
                                                 %w[. # # # .]
                                               ])

      expect(grid.state(0, -1, 4, 3, 1)).to eq([
                                                 %w[. . # . .],
                                                 %w[. # . . #],
                                                 %w[. . . . #],
                                                 %w[. # . . .],
                                                 %w[. . . . .]
                                               ])

      expect(grid.state(0, -1, 4, 3, 2)).to eq([
                                                 %w[. . . . .],
                                                 %w[. . . . .],
                                                 %w[. . # . .],
                                                 %w[. . . . .],
                                                 %w[. . . . .]
                                               ])
    end

    it 'has the correct state after three cycles' do
      3.times do
        grid.cycle
      end

      expect(grid.state(-1, -2, 5, 4, -2)).to eq([
                                                   %w[. . . . . . .],
                                                   %w[. . . . . . .],
                                                   %w[. . # # . . .],
                                                   %w[. . # # # . .],
                                                   %w[. . . . . . .],
                                                   %w[. . . . . . .],
                                                   %w[. . . . . . .]
                                                 ])

      expect(grid.state(-1, -2, 5, 4, -1)).to eq([
                                                   %w[. . # . . . .],
                                                   %w[. . . # . . .],
                                                   %w[# . . . . . .],
                                                   %w[. . . . . # #],
                                                   %w[. # . . . # .],
                                                   %w[. . # . # . .],
                                                   %w[. . . # . . .]
                                                 ])
    end

    it 'has the correct number of active cubes after 6 cycles' do
      6.times do
        grid.cycle
      end

      expect(grid.active_cubes.length).to eq(112)
    end
  end
end
