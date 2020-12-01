# frozen_string_literal: true

require 'advent_of_code_2020/day_01/sum_finder'

module AdventOfCode2020
  class Day01
    TARGET = 2020

    def initialize(input_file)
      @expenses = AdventOfCode2020::Utils.read_file(input_file, transform: :to_i)
      @sum_finder = SumFinder.new(@expenses, TARGET)
    end

    # Before you leave, the Elves in accounting just need you to fix your expense
    # report (your puzzle input); apparently, something isn't quite adding up.
    #
    # Specifically, they need you to find the two entries that sum to 2020 and then
    # multiply those two numbers together.
    def part_one
      two_entries = @sum_finder.find_two
      return if two_entries.nil?

      first, second = two_entries
      return if first.nil? || second.nil?

      first * second
    end

    # The Elves in accounting are thankful for your help; one of them even
    # offers you a starfish coin they had left over from a past vacation.
    #
    # They offer you a second one if you can find three numbers in your expense
    # report that meet the same criteria.
    def part_two
      three_entries = @sum_finder.find_three
      return if three_entries.nil?

      first, second, third = three_entries
      return if first.nil? || second.nil? || third.nil?

      first * second * third
    end
  end
end
