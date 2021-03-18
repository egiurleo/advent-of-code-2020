# frozen_string_literal: true

module AdventOfCode2020
  class Day22
    class Deck
      attr_reader :cards

      def initialize(*cards)
        @cards = cards
      end

      def draw_card
        cards.shift
      end

      def add_cards(*new_cards)
        cards.concat(new_cards)
      end

      def empty?
        cards.empty?
      end

      def length
        cards.length
      end

      def score
        cards.reverse.map.with_index do |card, idx|
          card * (idx + 1)
        end.sum
      end
    end
  end
end
