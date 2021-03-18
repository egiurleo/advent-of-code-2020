# frozen_string_literal: true

module AdventOfCode2020
  class Day22
    class Game
      attr_reader :deck1, :deck2, :winner

      PLAYER_1 = 'Player 1'
      PLAYER_2 = 'Player 2'

      def initialize(deck1, deck2)
        @deck1 = deck1
        @deck2 = deck2
        @winner = nil
      end

      def finished?
        !winner.nil?
      end

      def winning_deck
        return if winner.nil?

        winner == PLAYER_1 ? deck1 : deck2
      end

      def play
        round until finished?

        winner
      end

      private

      def round
        return if finished?

        card1 = deck1.draw_card
        card2 = deck2.draw_card

        if card1 > card2
          deck1.add_cards(card1, card2)
        else
          deck2.add_cards(card2, card1)
        end

        set_winner(PLAYER_2) if deck1.empty?
        set_winner(PLAYER_1) if deck2.empty?
      end

      def set_winner(winner)
        raise ArgumentError unless [PLAYER_1, PLAYER_2].include?(winner)

        @winner = winner
      end
    end
  end
end
