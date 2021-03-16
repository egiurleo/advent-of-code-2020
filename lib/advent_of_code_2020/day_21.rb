# frozen_string_literal: true

require 'advent_of_code_2020/day_21/food'
require 'advent_of_code_2020/day_21/food_processor'

module AdventOfCode2020
  class Day21
    attr_reader :foods

    def initialize(input_file)
      lines = AdventOfCode2020::Utils.read_file(input_file)
      @foods = lines.map do |line|
        ingredients, allergens = process_line(line)
        Food.new(ingredients, allergens)
      end
    end

    def part_one
      processor = FoodProcessor.new(foods)
      ingredients_without_allergens = processor.ingredients_without_allergens

      foods.sum do |food|
        food.ingredients.count do |ingredient|
          ingredients_without_allergens.include?(ingredient)
        end
      end
    end

    def part_two
      processor = FoodProcessor.new(foods)
      processor.ingredients_to_allergens.sort_by do |_ingredient, allergen|
        allergen
      end.map(&:first).join(',')
    end

    private

    def process_line(line)
      ingredients_str, allergens_str = line.split('(')

      allergens_str.gsub!(')', '')
      allergens_str.gsub!('contains ', '')
      allergens = allergens_str.split(', ')

      ingredients = ingredients_str.split

      [ingredients, allergens]
    end
  end
end
