# frozen_string_literal: true

require 'advent_of_code_2020/day_22/deck'
require 'advent_of_code_2020/day_22/game'
require 'advent_of_code_2020/day_22/recursive_game'

module AdventOfCode2020
  class Day22
    def initialize(input_file)
      lines = AdventOfCode2020::Utils.read_file(input_file)
      @deck1, @deck2 = parse_input(lines)
    end

    def part_one
      game = Game.new(
        Deck.new(*@deck1),
        Deck.new(*@deck2)
      )
      game.play
      game.winning_deck.score
    end

    def part_two
      game = RecursiveGame.new(
        Deck.new(*@deck1),
        Deck.new(*@deck2)
      )
      game.play
      game.winning_deck.score
    end

    private

    def parse_input(lines)
      deck1 = []
      deck2 = []
      parsing_deck1 = true

      lines.each do |line|
        next if line =~ /Player/

        if line.empty?
          parsing_deck1 = false
          next
        end

        parsing_deck1 ? deck1 << line.to_i : deck2 << line.to_i
      end

      [deck1, deck2]
    end
  end
end
