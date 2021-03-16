# frozen_string_literal: true

module AdventOfCode2020
  class Day21
    class Food
      attr_reader :ingredients, :allergens

      def initialize(ingredients, allergens)
        @ingredients = ingredients
        @allergens = allergens
      end
    end
  end
end
