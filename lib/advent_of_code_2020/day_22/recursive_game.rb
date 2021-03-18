# frozen_string_literal: true

module AdventOfCode2020
  class Day22
    class RecursiveGame < Game
      def initialize(deck1, deck2)
        @previous_rounds = []
        super
      end

      private

      def round
        return if finished?

        if identical_previous_round?
          set_winner(PLAYER_1)
          return
        end

        @previous_rounds << current_round

        card1 = deck1.draw_card
        card2 = deck2.draw_card

        if deck1.length >= card1 && deck2.length >= card2
          sub_game = RecursiveGame.new(
            Deck.new(*deck1.cards.dup[0...card1]),
            Deck.new(*deck2.cards.dup[0...card2])
          )
          sub_game.play
          round_winner = sub_game.winner
        else
          round_winner = card1 > card2 ? PLAYER_1 : PLAYER_2
        end

        if round_winner == PLAYER_1
          deck1.add_cards(card1, card2)
        else
          deck2.add_cards(card2, card1)
        end

        set_winner(PLAYER_2) if deck1.empty?
        set_winner(PLAYER_1) if deck2.empty?
      end

      def identical_previous_round?
        @previous_rounds.include?(current_round)
      end

      def current_round
        {
          deck1: deck1.cards.dup,
          deck2: deck2.cards.dup
        }
      end
    end
  end
end
