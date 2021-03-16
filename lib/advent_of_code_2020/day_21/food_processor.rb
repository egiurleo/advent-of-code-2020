# frozen_string_literal: true

module AdventOfCode2020
  class Day21
    class FoodProcessor
      attr_reader :ingredients, :allergens_to_ingredients, :foods

      def initialize(foods)
        @foods = foods
        @ingredients = foods.map(&:ingredients).flatten.uniq
        @allergens_to_ingredients = {}

        process
      end

      def ingredients_without_allergens
        ingredients - allergens_to_ingredients.values.map(&:first)
      end

      def ingredients_to_allergens
        ingredients_to_allergens = {}

        allergens_to_ingredients.each do |allergen, ingredients|
          next unless ingredients.length == 1

          ingredients_to_allergens[ingredients.first] = allergen
        end

        ingredients_to_allergens
      end

      private

      def process
        assigned_ingredients = []

        foods.each do |food|
          food.allergens.each do |allergen|
            allergens_to_ingredients[allergen] = if allergens_to_ingredients[allergen].nil?
                                                   food.ingredients - assigned_ingredients
                                                 else
                                                   allergens_to_ingredients[allergen].select do |ingredient|
                                                     food.ingredients.include?(ingredient)
                                                   end
                                                 end

            update_mapping(allergens_to_ingredients, assigned_ingredients)
          end
        end
      end

      def update_mapping(allergens_to_ingredients, assigned_ingredients)
        queue = allergens_to_ingredients.keys.select do |k|
          allergens_to_ingredients[k]&.length == 1 &&
            !assigned_ingredients.include?(allergens_to_ingredients[k].first)
        end

        until queue.empty?
          allergen = queue.shift
          ingredient = allergens_to_ingredients[allergen].first

          allergens_to_ingredients.each do |other_allergen, ingredients|
            if ingredients.include?(ingredient) && other_allergen != allergen
              ingredients.delete(ingredient)
              queue << other_allergen if ingredients.length == 1
            end
          end

          assigned_ingredients << ingredient
        end
      end
    end
  end
end
